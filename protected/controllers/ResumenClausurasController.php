<?php

class ResumenClausurasController extends Controller
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
				'actions'=>array('index','view','guardar_resumen'),
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
		$model=new ResumenClausuras;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['ResumenClausuras']))
		{
			$model->attributes=$_POST['ResumenClausuras'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}
                
                
                /*
                
		$this->render('create',array(
			'model'=>$model,
		));*/
                
                
                $_GET['convencion'];
                $dataProvider= new CActiveDataProvider('tipoClausura',array(
               
                     
                'pagination'=>array(
                'pageSize'=>20000,
                ),
                )
                );
                 
                
                $this->render('create',array(
			'dataProvider'=>$dataProvider, 'convencion'=>$_GET['convencion']
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

		if(isset($_POST['ResumenClausuras']))
		{
			$model->attributes=$_POST['ResumenClausuras'];
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
public function actionDelete($id,$convencion)
	{
		
                try{
                $transaction = Yii::app()->db->beginTransaction();
                $sql="select id from resumen_clausuras where cod_convencion='".$convencion."'";
                $existe=Yii::app()->db->createCommand($sql)->execute();
                if($existe!=0)
                $sql="delete from resumen_clausuras where cod_convencion='".$convencion."'";
                $borrar1=Yii::app()->db->createCommand($sql)->execute();
                $nombre_usuario=Yii::app()->user->Name;
                $userid=Yii::app()->user->id;
                       
                Yii::app()->db->createCommand("insert into activerecordlog (`description`, `action`, `model`, `idModel`, `creationdate`, `userid`)
                values ('User ".$nombre_usuario." delete resumen_clausuras where convencion is ".$convencion."','delete', 'ResumenClausuras','".$convencion."',now(),'".$userid."')")->execute();
                $transaction->commit();
                

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
                
                
                }catch(CDbException $error){
                    
                    $transaction->rollback();
                  //  echo "<div class='flash-error'>No se puede insertar nomina, alguno de los registros estan Repetidos.</div>"; //for ajax
                   echo "<div class='flash-error'>No se puede borrar Resumen_clausuras, Consulte Al Administrador. Error:".$error."</div>"; //for ajax
                   }
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('ResumenClausuras');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new ResumenClausuras('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['ResumenClausuras']))
			$model->attributes=$_GET['ResumenClausuras'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return ResumenClausuras the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=ResumenClausuras::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param ResumenClausuras $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='resumen-clausuras-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        
        
        
          public function actionguardar_resumen(){
            $datos=$_POST['datos'];
            $convencion=$_POST['convencion'];
            $datos=  explode(',', $datos);
            $posiciones=0;
            $bandera=0;
            $nombre_usuario=Yii::app()->user->Name;
            $userid=Yii::app()->user->id;
            try{
            $transaction = Yii::app()->db->beginTransaction();
            //print_r($datos); exit();
            foreach ($datos as $unidades){
            if($unidades!=null){
            
                $sql="select id from resumen_clausuras where cod_convencion='".$convencion."' and cod_tipo='".$posiciones."'";
                $existe=Yii::app()->db->createCommand($sql)->queryRow();
                if($existe){
                     Yii::app()->db->createCommand("update resumen_clausuras set  cantidad='".$unidades."' where id='".$existe['id']."'")->execute();
                     $bandera=1;
                     
                }
                else{
                Yii::app()->db->createCommand("insert into resumen_clausuras(`cod_convencion`, `cod_tipo`, `cantidad`)
                                  values ('".$convencion."','".$posiciones."', '".$unidades."')")->execute();
                }
                
                //guardar en bitacora
                $id_resumen=Yii::app()->db->getLastInsertID('ResumenClausuras');
                if($bandera==0)
                Yii::app()->db->createCommand("insert into activerecordlog (`description`, `action`, `model`, `idModel`, `creationdate`, `userid`)
                                  values ('User ".$nombre_usuario." created resumen_clausuras id ".$id_resumen."','CREATE', 'ResumenClausuras','".$id_resumen."',now(),'".$userid."')")->execute();
            else
            Yii::app()->db->createCommand("insert into activerecordlog (`description`, `action`, `model`, `idModel`, `creationdate`, `userid`)
                                  values ('User ".$nombre_usuario." update resumen_clausuras convencion ".$convencion." la cantidad de ".$unidades."','UPDATE', 'ResumenClausuras','".$posiciones."',now(),'".$userid."')")->execute();    
            $bandera=0;
            
            $posiciones++;
            
            }else{
                
            $posiciones++;}
            }
            
            
            $transaction->commit();
            
             }catch(CDbException $error){
                    
                    $transaction->rollback();
                
                   echo "<div class='flash-error'>Error:".$error."</div>"; //for ajax
                   } 
            
            
            
        }
        
}
