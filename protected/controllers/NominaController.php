<?php

class NominaController extends Controller
{
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='//layouts/column2';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			//'accessControl', // perform access control for CRUD operations
			//'postOnly + delete', // we only allow deletion via POST request
                    array('CrugeAccessControlFilter'),
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('index','view'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','create_cargo_sindicato','GetValue','llenar_check'),
				'users'=>array('@'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('admin'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
            
            
            
            
		$model=new Nomina;
                $bandera=0;
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
                
		if(isset($_POST['Import']) && $_POST['Nomina']['cod_convencion'])
		{
                 //echo "sss".$_POST['Nomina']['cod_convencion']; exit(); 
                    $filelist=CUploadedFile::getInstancesByName('csvfile');
                   
  // To validate 
           if($filelist)
               
               
           
               foreach($filelist as $file)
               { 
                   try{
                   $transaction = Yii::app()->db->beginTransaction();
                   $handle = fopen("$file->tempName", "r");
                   $row = 0;
                   while (($data = fgetcsv($handle, 1000, ";")) !== FALSE) {
                       //que hace el row
                       if($row>4){
                             $newmodel=new Nomina();       
                             //print_r($data); exit();
                             if(!empty($data[3]) && ($data[3]=='x' || $data[3]=='X')){
                                 $data[3]='V';
                             }else{
                                 if(!empty($data[4]) && ($data[4]=='x' || $data[4]=='X')){
                                 $data[3]='E';
                             }else{
                                 echo "<script type='text/javascript'>
                                        alert('Error, Nacionalidad No Cumple Los Parametros');
                                        history.back(-1);
                                        </script>"; 
                                        $transaction->rollback();
                                        
                                        exit(); 
                             }
                             
                                 }
                            
                             if($data[9]!='S' && $data[9]!='C' && $data[9]!='D' && $data[9]!='V'){
                                 
                                  echo "<script type='text/javascript'>
                                        alert('Error, Estado Civil No Cumple Los Parametros');
                                        history.back(-1);
                                        </script>"; 
                                        $transaction->rollback();
                                        
                                        exit();
                             }
                             
                             //verificando si existe el codigo de nivel educativo
                             
                             $resultado_sql= Yii::app()->db->createCommand("SELECT id as resultado from nivel_educativo where cod_interno='0".$data[10]."'")->queryRow();
                            
                             if($resultado_sql['resultado']<1){
                           
                             echo "<script type='text/javascript'>
                                        alert('Error, Codigo De Nivel Educativo No Existe');
                                        history.back(-1);
                                        </script>"; 
                                        $transaction->rollback();
                                        exit();
                       }
                             
                             
                             
                                 
                      $model_nomina=new Nomina; 
                              $model_nomina->nombres=utf8_encode($data[1]); 
                              $model_nomina->cedula=$data[2];       
                              $model_nomina->nacionalidad=$data[3];
                              $model_nomina->pais_origen=$data[5];
                              $model_nomina->lugar_nacimiento=utf8_encode($data[6]);
                              $model_nomina->sexo=$data[7];
                              $model_nomina->edad=$data[8];
                              $model_nomina->estado_civil=$data[9];
                              $model_nomina->nivel_educativo="0".$data[10];
                              $model_nomina->grado_anio_aprobado=utf8_encode($data[11]);
                              $model_nomina->oficio_dentro_establecimiento=$data[12];
                              $model_nomina->codigo_ocupacion=$data[13];
                              $model_nomina->tiempo_serv_establecimiento_anios=$data[14];
                              $model_nomina->tiempo_serv_establecimiento_meses=$data[15];
                              $model_nomina->tiempo_ejerciendo_profesion_anios=$data[16];
                              $model_nomina->tiempo_ejerciendo_profesion_meses=$data[17];
                              $model_nomina->remuneracion_antes_contra_empleado=$data[18];
                              $model_nomina->remuneracion_antes_contra_obrero=$data[19];
                              $model_nomina->remuneracion_despues_contra_empleado=$data[20];
                              $model_nomina->remuneracion_despues_contra_obrero=$data[21];
                              $model_nomina->carga_familiar=$data[22];
                              $model_nomina->cod_convencion=$_POST['Nomina']['cod_convencion'];
                              if(!empty($_POST['Nomina']['id_empresa']))
                              $model_nomina->id_empresa=$_POST['Nomina']['id_empresa'];
                              else{
                                   echo "<script type='text/javascript'>
                         alert('Error, Seleccione la Empresa Asociada A la Nomina');
                         history.go(-1);
                         </script>"; exit();
                              }
                             if(!empty($_POST['Nomina']['id_sindicato']))
                              $model_nomina->id_sindicato=$_POST['Nomina']['id_sindicato'];
                              else{
                                   echo "<script type='text/javascript'>
                         alert('Error, Falta el codigo de Sindicato');
                         history.go(-1);
                         </script>"; exit();
                              }
                              
                               
                              $llenar = Yii::app()->db->createCommand()->insert($model_nomina->tableName(),$model_nomina->attributes);
                              
                             
                            //  $newmodel->save();            
                       
            //Yii::app()->db->createCommand("insert into trabajador_sindicato(`nomina_sindicato`,`trabajador`) values ('".$_POST['Nomina']['cod_convencion']."', '".$data[2]."')")->execute();
                             }
                       $row++;               
                   }
                   
                       $id_nomina=Yii::app()->db->getLastInsertID('Nomina'); 
                       $nombre_usuario=Yii::app()->user->Name;
                       $userid=Yii::app()->user->id;
                       
                        Yii::app()->db->createCommand("insert into activerecordlog (`description`, `action`, `model`, `idModel`, `creationdate`, `userid`)
                                  values ('User ".$nombre_usuario." created nomina ultimo id ".$id_nomina."','CREATE', 'Nomina','".$id_nomina."',now(),'".$userid."')")->execute();
                  
                        
                            $transaction->commit();
                   
                            $bandera=1;
                         echo "<script type='text/javascript'>
                         alert('Se Ha Guardado Con exito La Nomina');
                         </script>";
                   }catch(CDbException $error){
                    
                    $transaction->rollback();
                
                   echo "<div class='flash-error'>No se puede insertar nomina, alguno de los registros estan Repetidos. Error:".$error."</div>"; //for ajax
                   }                    
               }                            
                                  
 
                    
                    
                    
                    
//			$model->attributes=$_POST['Nomina'];
//			if($model->save())
//				$this->redirect(array('view','id'=>$model->id));
		}
                if($bandera==1)
                $this->redirect(array('nomina/create_cargo_sindicato','convencion'=>$_POST['Nomina']['id_empresa'],'id_sindicato'=>$_POST['Nomina']['id_sindicato']));
		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id,$convencion)
	{
		
                $model=Nomina::model()->findByAttributes(array('cedula'=>$_GET['id'],'cod_convencion'=>$_GET['convencion']));
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
                    if(isset($_POST['Nomina']))
		{
			$data=$_POST['Nomina'];
                     //   echo $data['nombres']; exit();
                    
                    $llenar = Yii::app()->db->createCommand("update nomina set 
                     `nombres`='".$data['nombres']."',
                     `cedula`='".$data['cedula']."',
                     `nacionalidad`='".$data['nacionalidad']."',
                     `pais_origen`='".$data['pais_origen']."',
                     `lugar_nacimiento`='".$data['lugar_nacimiento']."',
                     `sexo`='".$data['sexo']."',
                     `edad`='".$data['edad']."',
                     `estado_civil`='".$data['estado_civil']."',
                     `nivel_educativo`='".$data['nivel_educativo']."',
                     `grado_anio_aprobado`='".$data['grado_anio_aprobado']."',
                     `oficio_dentro_establecimiento`='".$data['oficio_dentro_establecimiento']."',
                     `codigo_ocupacion`='".$data['codigo_ocupacion']."',
                     `tiempo_serv_establecimiento_anios`='".$data['tiempo_serv_establecimiento_anios']."',
                     `tiempo_serv_establecimiento_meses`='".$data['tiempo_serv_establecimiento_meses']."',
                     `tiempo_ejerciendo_profesion_anios`='".$data['tiempo_ejerciendo_profesion_anios']."',
                     `tiempo_ejerciendo_profesion_meses`='".$data['tiempo_ejerciendo_profesion_meses']."',
                     `remuneracion_antes_contra_empleado`='".$data['remuneracion_antes_contra_empleado']."',
                     `remuneracion_antes_contra_obrero`='".$data['remuneracion_antes_contra_obrero']."',
                     `remuneracion_despues_contra_empleado`='".$data['remuneracion_despues_contra_empleado']."',
                     `remuneracion_despues_contra_obrero`='".$data['remuneracion_despues_contra_obrero']."',
                     `carga_familiar`='".$data['carga_familiar']."',
                     `cod_convencion`='".$data['cod_convencion']."'
                     where id='".$data['id']."'")->execute();    
                       
                       $nombre_usuario=Yii::app()->user->Name;
                       $userid=Yii::app()->user->id;
                       
                        Yii::app()->db->createCommand("insert into activerecordlog (`description`, `action`, `model`, `idModel`, `creationdate`, `userid`)
                        values ('User ".$nombre_usuario." update nomina  id ".$userid."','update', 'Nomina','".$data['id']."',now(),'".$userid."')")->execute();
                                
                                if($llenar)
				$this->redirect(array('view','id'=>$model->id));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id,$convencion)
	{
		//$this->loadModel($id)->delete();
           
                  try{
                $transaction = Yii::app()->db->beginTransaction();
              echo  $sql="select id from nomina_tipo_sindicato where cod_convencion_nomina='".$convencion."'";
                $existe=Yii::app()->db->createCommand($sql)->execute();
                if($existe!=0)
                $sql="delete from nomina_tipo_sindicato where cod_convencion_nomina='".$convencion."'";
                $borrar1=Yii::app()->db->createCommand($sql)->execute();
                if($borrar1 || $existe==0){
                $sql="delete from nomina where id_empresa='".$convencion."'";
                $borrar1=Yii::app()->db->createCommand($sql)->execute();
                $nombre_usuario=Yii::app()->user->Name;
                $userid=Yii::app()->user->id;
                       
                Yii::app()->db->createCommand("insert into activerecordlog (`description`, `action`, `model`, `idModel`, `creationdate`, `userid`)
                values ('User ".$nombre_usuario." delete nomina y nomina tipo_sindicato where convencion is ".$convencion."','delete', 'Nomina-nomina_tipo_sindicato','".$convencion."',now(),'".$userid."')")->execute();
                $transaction->commit();
                }
		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
		$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
                }catch(CDbException $error){
                    
                    $transaction->rollback();
                  //  echo "<div class='flash-error'>No se puede insertar nomina, alguno de los registros estan Repetidos.</div>"; //for ajax
                   echo "<div class='flash-error'>No se puede borrar Nomina, Consulte Al Administrador. Error:".$error."</div>"; //for ajax
                   }               
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('Nomina');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Nomina('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Nomina']))
			$model->attributes=$_GET['Nomina'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Nomina the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Nomina::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Nomina $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='nomina-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        
        
        
        public function Actioncreate_cargo_sindicato(){
            
               
                 $dataProvider= new CActiveDataProvider('nomina',array(
                'criteria'=>array(
                'select'=>" id, cedula,cod_convencion, id_empresa",
                'condition'=>"id_empresa='".$_GET['convencion']."'"
                ),
                     
                'pagination'=>array(
                'pageSize'=>20000,
                ),
                )
                );
                 
                
                $this->render('create_cargo_sindicato',array(
			'dataProvider'=>$dataProvider, 
		));
            
            
        }
        
        
        public function actionGetValue(){
 
     
         //trabajadores beneficiados   
        if(!empty($_POST['theIds'])){    
            $arr=$_POST['theIds'];
        
        $pp=  funciones::llenar_check(1,$arr, $_POST['status'],$_POST['convencion']);
         
        }
       
        //////////////*******************trabajadores_sindicato
        if(!empty($_POST['theIds1'])){    
        
            $arr1=$_POST['theIds1'];
        
            
            
        //$arr1 = explode(',', $_POST['theIds1']);
        //almacenar en dos arreglos
       $pp=  funciones::llenar_check(2,$arr1, $_POST['status'],$_POST['convencion']);
        
        }
        
       //////////////*******************Secretario General
        if(!empty($_POST['theIds2'])){    
            $arr2=$_POST['theIds2'];
        
            
        //$arr2= explode(',', $_POST['theIds2']);
         $pp=  funciones::llenar_check(3,$arr2, $_POST['status'], $_POST['convencion']);
        
        }
        
           //****************************secretario Ejecutivo
        if(!empty($_POST['theIds3'])){
        

            $arr3=$_POST['theIds3'];
        


        //$arr3 = explode(',', $_POST['theIds3']);
        $pp=  funciones::llenar_check(4,$arr3, $_POST['status'], $_POST['convencion']);
        }
         
        
            //secretario tesorero
        if(!empty($_POST['theIds4'])){    
        
            $arr4=$_POST['theIds4'];
        
        //$arr4 = explode(',', $_POST['theIds4']);
        $pp=  funciones::llenar_check(5,$arr4, $_POST['status'], $_POST['convencion']);
        }
        
            //secretario finanzas
        if(!empty($_POST['theIds5'])){    
        
            $arr5=$_POST['theIds5'];
          
        //$arr5 = explode(',', $_POST['theIds5']);
        $pp=  funciones::llenar_check(6,$arr5, $_POST['status'], $_POST['convencion']);
        }
        
        //secretario trabajo
        if(!empty($_POST['theIds6'])){    
        
            $arr6=$_POST['theIds6'];
        

        //$arr6 = explode(',', $_POST['theIds6']);
        $pp=  funciones::llenar_check(7,$arr6, $_POST['status'], $_POST['convencion']);
        }
        
           //secretario deporte
        if(!empty($_POST['theIds7'])){    
            $arr7=$_POST['theIds7'];
        
            
        //$arr7 = explode(',', $_POST['theIds7']);
        $pp=  funciones::llenar_check(8,$arr7, $_POST['status'], $_POST['convencion']);
        
        }
        
        
           //secretario organizacion
        if(!empty($_POST['theIds8'])){    
        //$arr8 = explode(',', $_POST['theIds8']);
            $arr8=$_POST['theIds8'];
        
            
            
        $pp=  funciones::llenar_check(9,$arr8, $_POST['status'], $_POST['convencion']);
        }
        
        
           //secretario actas y correspondencias
        if(!empty($_POST['theIds9'])){    
        //$arr9 = explode(',', $_POST['theIds9']);
        
            $arr9=$_POST['theIds9'];
        
            
        $pp=  funciones::llenar_check(10,$arr9, $_POST['status'], $_POST['convencion']);
        }
        
        //secretario salud laboral
        if(!empty($_POST['theIds10'])){    
        
            $arr10=$_POST['theIds10'];
         
        $pp=  funciones::llenar_check(11,$arr10, $_POST['status'], $_POST['convencion']);
        }
        
        
        //secretario vigilancia
        if(!empty($_POST['theIds11'])){    
        
            $arr11=$_POST['theIds11'];
         
            
            
         $pp=  funciones::llenar_check(12,$arr11, $_POST['status'], $_POST['convencion']);
        
        }
       
        
        //secretario otro
        if(!empty($_POST['theIds12'])){    
         
        
            $arr12=$_POST['theIds12'];
        
            //almacenar en dos arreglos
       $pp=  funciones::llenar_check(13,$arr12, $_POST['status'], $_POST['convencion']);
        }
        
        
        //delegado sindical
        if(!empty($_POST['theIds13'])){    
       
            $arr13=$_POST['theIds13'];
       
         $pp=  funciones::llenar_check(14,$arr13, $_POST['status'], $_POST['convencion']);
        
        }
        
        
       
    }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
        
        
}
