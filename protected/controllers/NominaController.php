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
			'accessControl', // perform access control for CRUD operations
			'postOnly + delete', // we only allow deletion via POST request
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
				'actions'=>array('create','update'),
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
                             
                             $data[3]='E';
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
                             
                             
                             
                                 
                           
            $llenar = Yii::app()->db->createCommand("INSERT INTO nomina( `nombres`,`cedula`, `nacionalidad`, `pais_origen`, `lugar_nacimiento`, `sexo`,
                     `edad`, `estado_civil`, `nivel_educativo`, `grado_anio_aprobado`, `oficio_dentro_establecimiento`, `codigo_ocupacion`,
                     `tiempo_serv_establecimiento_anios`, `tiempo_serv_establecimiento_meses`, `tiempo_ejerciciendo_prefesion_anios`,
                     `tiempo_ejerciendo_profesion_meses`, `remuneracion_antes_contra_empleado`, `remuneracion_antes_contra_obrero`,
                     `remuneracion_despues_contra_empleado`, `remuneracion_despues_contra_obrero`, `carga_familiar`, `cod_convencion`)
                    VALUES 
                    ('".$data[1]."','".$data[2]."','".$data[3]."',
                    '".$data[5]."','".$data[6]."','".$data[7]."',
                    '".$data[8]."','".$data[9]."','0".$data[10]."',
                    '".$data[11]."','".$data[12]."','".$data[13]."',
                    '".$data[14]."','".$data[15]."','".$data[16]."',
                    '".$data[17]."','".$data[18]."','".$data[19]."','".$data[20]."','".$data[21]."','".$data[22]."','".$_POST['Nomina']['cod_convencion']."')")->execute();
                             

                            //  $newmodel->save();            
                       
            Yii::app()->db->createCommand("insert into trabajador_sindicato(`nomina_sindicato`,`trabajador`) values ('".$_POST['Nomina']['cod_convencion']."', '".$data[2]."')")->execute();
                             }
                       $row++;               
                   }
                   
                   
                   $transaction->commit();
                   $bandera=1;
                         echo "<script type='text/javascript'>
                         alert('Se Ha Guardado Con exito La Nomina');
                         </script>";
                   }catch(CDbException $error){
                    
                    $transaction->rollback();
                    echo "<div class='flash-error'>No se puede insertar nomina, alguno de los registros estan Repetidos.</div>"; //for ajax
                   //echo "<div class='flash-error'>No se puede insertar nomina, alguno de los registros estan Repetidos. Error:".$error."</div>"; //for ajax
                   }                    
               }                            
                                  
 
                    
                    
                    
                    
//			$model->attributes=$_POST['Nomina'];
//			if($model->save())
//				$this->redirect(array('view','id'=>$model->id));
		}
                if($bandera==1)
                $this->redirect(array('Trabajador_sindicato/create','convencion'=>$_POST['Nomina']['cod_convencion']));
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
		//$model=$this->loadModel($id);
                $model=Nomina::model()->findByAttributes(array('cedula'=>$_GET['id'],'cod_convencion'=>$_GET['convencion']));
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

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
                     `tiempo_ejerciciendo_prefesion_anios`='".$data['tiempo_ejerciciendo_prefesion_anios']."',
                     `tiempo_ejerciendo_profesion_meses`='".$data['tiempo_ejerciendo_profesion_meses']."',
                     `remuneracion_antes_contra_empleado`='".$data['remuneracion_antes_contra_empleado']."',
                     `remuneracion_antes_contra_obrero`='".$data['remuneracion_antes_contra_obrero']."',
                     `remuneracion_despues_contra_empleado`='".$data['remuneracion_despues_contra_empleado']."',
                     `remuneracion_despues_contra_obrero`='".$data['remuneracion_despues_contra_obrero']."',
                     `carga_familiar`='".$data['carga_familiar']."',
                     `cod_convencion`='".$data['cod_convencion']."'
                    where id='".$data['id']."'")->execute();    
                    
                    
                    
                      //  $model->attributes=$_POST['Nomina'];
                        
                                //$model->attributes=
                        //print_r($model->attributes); exit();
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
	public function actionDelete($id)
	{
		$this->loadModel($id)->delete();

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
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
}
