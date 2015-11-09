<?php

class ConvencionController extends Controller
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
                    array('CrugeAccessControlFilter')
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
				'actions'=>array('index','view','ordenar_convenciones', 'ordenar','cambiarpadre'),
				'users'=>array('@'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','actualizar'),
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
		$model=new Convencion;
                $bandera=0;
		
                $resultado="";
                if(isset($_GET['antecedente'])){
                    
                 $connection = Yii::app()->db;
                    $sql ="SELECT cod_convencion as referencia
                        FROM convencion AS p
                        where id =".$_GET['antecedente'];
                    
                    
                    $command = $connection->createCommand($sql);
                    $dataReader = $command->query();
                    $rows = $dataReader->readAll();
                    $codi=explode("-",$rows[0]['referencia']);
                    // empezamos a buscar las convenciones mayores q tengan ese id
                   
                   $resultado_sql= Yii::app()->db->createCommand("SELECT substring(max(cod_convencion),-2) as resultado from convencion where SUBSTRING_INDEX(cod_convencion, '-', 1)=$codi[0]")->queryRow();
                    if($resultado_sql['resultado']<9){
                        $rows[0]['referencia']="0".($resultado_sql['resultado']+1);
                    }else{
                        $rows[0]['referencia']=$resultado_sql['resultado']+1;
                    }
                    $resultado=$codi[0]."-".($rows[0]['referencia']);
                    $model=$this->loadModel($_GET['antecedente']);
                    $this->render('convencion_antecedente',array(
			'model'=>$model, 'resultado'=>$resultado, 'bandera'=>1,
		));
                    $bandera=1;
                    
                }
                
                
                
                
		if(isset($_POST['Convencion']))
		{   
                       $antecedente=0;
                       $model->attributes=$_POST['Convencion'];
                       $llenar = Yii::app()->db->createCommand("select max(id) as resultado from convencion")->queryRow();
                       $model->id=($llenar['resultado']+1);
                       // si esta vacia es por que es nueva y seria padre 
                       if(empty($model->cod_convencion)){
                            $model->cod_convencion= ($llenar["resultado"]+1)."-01";
                            $antecedente=1;
                            }
                        
                        $model->isNewRecord=true;
			if($model->save()){
                            Yii::app()->user->setFlash('success',"Datos grabados correctamente!");
                            $this->redirect(array('Empresa/create','convencion'=>$model->id));
                            
                            
                        }
                        }
                
                
                //if bandera es 1 es relacional
                if($bandera!=1)
		$this->render('create',array(
			'model'=>$model,
                        'resultado'=>$resultado,
                        'bandera'=>'0',
		));
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

		if(isset($_POST['Convencion']))
		{
			$model->attributes=$_POST['Convencion'];
			
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
        
        
        public function actionOrdenar_Convenciones(){
        	$unico=0;
            $form=$this->beginWidget('CActiveForm', 
            array('id'=>'formactu',
            'action' => array('Convencion/ordenar_convenciones'),
            'method'=>'get',
            )); 
            
                if(isset($_GET['padre'])){
                    //echo "SELECT substring(max(cod_convencion),-2) as resultado from convencion where nombre like '%".$_GET['padre']."%'";exit();
                $resultado_sql= Yii::app()->db->createCommand("SELECT cod_convencion as resultado from convencion where nombre like '%".$_GET['padre']."%'")->queryRow();
                $result=  explode('-',$resultado_sql['resultado']);
                
                $result_relacionales= YII::app()->db->createCommand("SELECT  count(id) as total, nombre, numero_expediente, inspectoria, fecha_auto_homo, cod_convencion FROM `convencion` WHERE `cod_convencion` like '".$result[0]."-%' order by cod_convencion asc")->queryRow();
                //echo $result_relacionales['total']."<br>";
                $cantidad=$result_relacionales['total'];
                if($cantidad>0){
                    
                }$unico=1;
                $consulta="SELECT  * FROM `convencion` WHERE `cod_convencion` like '".$result[0]."-%' order by cod_convencion asc";
                $dataProvider = new CSqlDataProvider($consulta, 
                        array(
                         'id'=> 'cambiar_padre',
                         'totalItemCount' => $cantidad,
                          'sort' => array(
                              'attributes'=>array( 'id', 'nombre', 'numero_expediente', 'inspectoria', 'fecha_auto_homo', 'cod_convencion',
                                  
                              ),
                          ),
                            'pagination'=> array(
                                'pageSize'=> 10,
                            ),
                        ));
                
                    $this->render('ordenar',array(
			'dataProvider'=>$dataProvider,
		)); 
                    
        }   
            
        
                if($unico==0){
                $dataProvider=new CActiveDataProvider('Convencion');
                $total=$dataProvider->getTotalItemCount();
                
		$this->render('ordenar_convenciones',array(
			'dataProvider'=>$dataProvider, 'total'=>$total,
		));    
                }
            
        }
        
        
        
        
        public function actionOrdenar(){
            
            
        }
        
        
        public function actionCambiarpadre(){
            $bandera=0;
            $model=$this->loadModel($_POST['cambiarpor']);
            $model2=$this->loadModel($_POST['yosoy']);
            $tmp=$model2->cod_convencion;
            $model2->cod_convencion="00-1";
            $tmp1=$model->cod_convencion;
            $model->cod_convencion="00-2";
                
            
            if($model->save()){
              if($model2->save()){
            $model->cod_convencion=$tmp;
            $model2->cod_convencion=$tmp1;
            if($model->save())
            if($model2->save())
            echo "1"; 
                else
                   print_r($model2->getErrors());
                else
                 print_r($model->getErrors());   
            }else{
                 print_r($model2->getErrors());
            }
            
            }else{
            print_r($model->getErrors());
            }
           
            
            

            
                     
                            
                
                
                
            
            
            
           
            
            
        }
        

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
            
            
		$dataProvider=new CActiveDataProvider('Convencion');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Convencion('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Convencion']))
			$model->attributes=$_GET['Convencion'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Convencion the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Convencion::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Convencion $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='convencion-form')
		{
                    
                        
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
