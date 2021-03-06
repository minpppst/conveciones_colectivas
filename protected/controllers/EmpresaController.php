<?php

class EmpresaController extends Controller
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
				'actions'=>array('index','view','selectmunicipio', 'selectparroquia','llenarcampos','autocomplete'),
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
		$model=new Empresa;
                $bandera=0;
                //verificamos si es empresa con antecedente
                if(empty($_GET['nueva'])){
                    $_GET['nueva']=0;
                }
                if(isset($_GET['convencion']) && !isset($_POST['Empresa']) && $_GET['nueva']!=1){
                    
                  $resultado= Yii::app()->db->createCommand("SELECT cod_convencion as referencia
                        FROM convencion AS p
                        where id =".$_GET['convencion'])->queryRow();
                  //echo $resultado['referencia']; exit();
                        $codi=explode("-",$resultado['referencia']);
                        
                       // $resultado_sql= Yii::app()->db->createCommand("SELECT substring(min(cod_convencion),-2) as resultado from convencion where SUBSTRING_INDEX(cod_convencion, '-', 1)=$codi[0]")->queryRow();
                        // ya tengo al padre ahora vamos a sacar una empresa que tenga al padre asociado
                        $resultado_sql= Yii::app()->db->createCommand("SELECT id as resultado from empresa where SUBSTRING_INDEX(cod_convencion, '-', 1)=$codi[0]")->queryRow();
                        if($resultado_sql['resultado']>0){
                        $model=$this->loadModel($resultado_sql['resultado']);
                        $this->render('empresa_antecedente',array(
			'model'=>$model, 'convencion'=>$_GET['convencion'],'bandera'=>'1'));
                        $bandera=1;
                   }
                    
                }
                
                
                
                
                
                
                
		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Empresa']) && isset($_POST['yt0']))
		{
                if(isset($_POST['empresarelacional']))
                    $sindi=$_POST['empresarelacional'];
                else
                    $sindi="0";
                        
                           
			$model->attributes=$_POST['Empresa'];
                        $model->telefono=$_POST['telefono'][0]."/".$_POST['telefono'][1];
			if($model->save()){
                             if($sindi==1){
                            $this->redirect(array('sindicato/create','convencion'=>$model->cod_convencion, 'id_empresa'=>$model->id));
                             }else{
                            $this->redirect(array('sindicato/create','convencion'=>$model->cod_convencion, 'id_empresa'=>$model->id));
                             }
                        }
		}
                if($bandera==0){
                    
                
		$this->render('create',array(
			'model'=>$model,
		));
                }
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Empresa']) && isset($_POST['telefono']) && isset($_POST['yt0']))
		{
                    
                        
			$model->attributes=$_POST['Empresa'];
                        $model->telefono=$_POST['telefono'][0]."/".$_POST['telefono'][1];
                        
                       
                        
                        if($model->save())
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
		$dataProvider=new CActiveDataProvider('Empresa');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Empresa('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Empresa']))
			$model->attributes=$_GET['Empresa'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Empresa the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Empresa::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Empresa $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='empresa-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        
        
        public function actionSelectmunicipio(){
            
           $id_estado= $_POST['Empresa']['estado']; 
           $lista= Municipios::model()->findAll('id_estado= :estado',array(':estado'=>$id_estado));
            $lista=CHtml::listData($lista,'id_municipio','municipio');
           echo CHtml::tag('option',array('value'=>''),'Seleccione un Municipio...',true);
            foreach ($lista as $valor =>$municipio){
                echo CHtml::tag('option',array('value'=>$valor),CHtml::encode($municipio),true);
            }
            
        } 
        
        
         public function actionSelectparroquia(){
            
             $id_municipio= $_POST['Empresa']['municipio']; 
           $lista= Parroquias::model()->findAll('id_municipio= :id_municipio',array(':id_municipio'=>$id_municipio));
            $lista=CHtml::listData($lista,'id_parroquia','parroquia');
           echo CHtml::tag('option',array('value'=>''),'Seleccione una Parroquia...',true);
            foreach ($lista as $valor =>$parroquia){
                echo CHtml::tag('option',array('value'=>$valor),CHtml::encode($parroquia),true);
            }
            
        }
        
        public function actionLlenarCampos(){
        $rama=$_POST['datos'];
        if(empty($rama)){
    
       echo "Usted No Ha Seleccionado Su Actividad Economica";
    
        }else{
        $llenar = Yii::app()->db->createCommand("select seccion, division,grupo, clase 
            from seccion as a, division as b, grupo as c, clase as d, rama as e 
            where e.codigo_clase=d.codigo_clase and 
            e.codigo_grupo=c.codigo_grupo and 
            e.codigo_division=b.cod_division and 
            e.codigo_seccion=a.codigo and e.id=".$rama." and
            d.codigo_grupo=c.codigo_grupo and
            d.codigo_division=b.cod_division and
            d.codigo_seccion=a.codigo and
            c.cod_division=b.cod_division and
            c.cod_seccion=a.codigo and
            b.cod_seccion=a.codigo")->queryRow();
        $seccion = $llenar["seccion"];
        $division = $llenar["division"];
        $grupo = $llenar["grupo"];
        $clase= $llenar["clase"];

        echo   "<pre> <b>SECCION:</b>".$seccion." \r\n <b>DIVISION:</b>".$division." \r\n "."<b>GRUPO:</b>".$grupo." \r\n <b>CLASE:</b>".$clase." </pre>";

            }


    
        }

        public function actionAutoComplete($term){
       	$query = Rama::model()->findAll(
            'rama LIKE :term',
            array(':term'=>"%$term%"));
   
    $list = array();        
    foreach($query as $q){
        $data['value']= $q['id'];
        $data['label']= $q['rama'];

        $list[]= $data;
        unset($data);
       
                }

                echo json_encode($list);
                }
        
        
        
        
        
        
        
        
        
        
        
        
}
