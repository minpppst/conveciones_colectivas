<?php

class ClausurasController extends Controller
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
				'actions'=>array('index','view','subtipo','cargar_campos','editar_campos'),
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
		$model=new Clausuras;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);
                
               
		if(isset($_POST['Clausuras']) )
		{    
                 
                 
                    $mensaje1=1;
                    if(!empty($_POST['Clausuras']['sub_tipo'])){
                    $sql="select id, upper(nombre_variable) as nombre_variable from variable_subtipo_clausura where id_subtipo='".$_POST['Clausuras']['sub_tipo']."'";
                    $resultado=YII::app()->db->createCommand($sql)->queryAll();
                    
                    try{
                    $transaction = Yii::app()->db->beginTransaction();
                   
                    foreach($resultado as $valor){
                        
                         //Verificando que no exista en la misma convencion clausuras con distinto numero e iguales caracteristicas
                        $verificar="select id from clausuras where cod_convencion='".$_POST['Clausuras']['cod_convencion']."' and nro_clausura='".$_POST['Clausuras']['nro_clausura']."' and tipo_clausura='".$_POST['Clausuras']['tipo_clausura']."' and sub_tipo='".$_POST['Clausuras']['sub_tipo']."' and id_variable='".$valor['id']."'";
                        $verificando=YII::app()->db->createCommand($verificar)->queryAll();
                       
                        if(count($verificando)>0){
                             Yii::app()->user->setFlash('error',"¡Error Al Registrar Clausura!, Ya Existe Una Clausura Con Estas Caracteristicas");
                        $mensaje1=1;
                             
                        }else{
                     $model=new Clausuras;
                     if(isset($_POST[str_replace(' ', '', $valor['nombre_variable'])])){
                     $model->attributes=$_POST['Clausuras'];
                     
                     $model->id_variable=$valor['id'];
                     $model->valor=$_POST[str_replace(' ', '', $valor['nombre_variable'])];
                     
                     $model->save();
                      $mensaje1=0; 
                   
                     $transaction->commit();
                     }//si existe la variable se toma su valor e id de la variable en caso que no exista no se guardará
                     }//fin de verificar
                     
                     } 
                    }  catch(CDbException $error){
                       
                       //  Yii::app()->user->setFlash('error',$error);
                          Yii::app()->user->setFlash('error',"¡Error Al Registrar Clausura!, Verificar Si Ya Existe");
                          $mensaje1=1;
                          $transaction->rollback();
                    }
                    if($mensaje1==0)
                     Yii::app()->user->setFlash('success',"¡Datos grabados correctamente!");
                     
                   
			//$model->attributes=$_POST['Clausuras'];
			//if($model->save())
			//	$this->redirect(array('view','id'=>$model->id));
                }//fin del post sub
                else{
                    $model->attributes=$_POST['Clausuras'];
                    $model->validate();
                }
                }

		$this->render('create',array(
			'model'=>$model,
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
               
		if(isset($_POST['Clausuras']))
		{
                    if(!empty($_POST['Clausuras']['sub_tipo'])){
                    //por motivos de programacion es mas facil borrar y volver a insertar el campo
                    $verificar="select id from clausuras where cod_convencion='".$_POST['Clausuras']['cod_convencion']."' and nro_clausura='".$model->nro_clausura."' and tipo_clausura='".$model->tipo_clausura."' and sub_tipo='".$model->sub_tipo."'";
                    $verificando=YII::app()->db->createCommand($verificar)->queryAll();
                     $transaction = Yii::app()->db->beginTransaction();
                    try{
                    
                   
                    foreach($verificando as $valor2){
                    $this->loadModel($valor2['id'])->delete();
                     }//fin del segundo foreach
                    $sql="select id, upper(nombre_variable) as nombre_variable from variable_subtipo_clausura where id_subtipo='".$_POST['Clausuras']['sub_tipo']."'";
                    $resultado=YII::app()->db->createCommand($sql)->queryAll();
                    
                    foreach($resultado as $valor){
                   $model=new Clausuras;
                    
                    //$model=$this->loadModel($valor2['id']);
                    $verificar="select id from clausuras where cod_convencion='".$_POST['Clausuras']['cod_convencion']."'  and tipo_clausura='".$_POST['Clausuras']['tipo_clausura']."' and sub_tipo='".$_POST['Clausuras']['sub_tipo']."' and id_variable='".$valor['id']."'";
                    $verificando=YII::app()->db->createCommand($verificar)->queryAll();
                       
                        if(count($verificando)>0){
                             Yii::app()->user->setFlash('error',"¡Error Al Editar Clausura!, Ya Existe Una Clausura Con Estas Caracteristicas");
                        $mensaje1=1;
                             
                        }else{
                            //para editar necesitar recorrer la tabla clausuras para obtener los id correspondientes de la ediccion
                            
                            
                            
                     if(isset($_POST[str_replace(' ', '', $valor['nombre_variable'])])){
                   
                     $model->attributes=$_POST['Clausuras'];
                     $model->id_variable=$valor['id'];
                     $model->valor=$_POST[str_replace(' ', '', $valor['nombre_variable'])];
                     
                     //$model->validate();
                     $model->save();
                     
                     }//si existe la variable se toma su valor e id de la variable en caso que no exista no se guardará
                     }//fin de verificar
                   
                    }//fion del primer foreach
                    
                     $transaction->commit();
                   
                    }//del del try
                     catch(CDbException $error){
                       
                       //  Yii::app()->user->setFlash('error',$error);
                          Yii::app()->user->setFlash('error',"¡Error Al Registrar Clausura!, Verificar Si Ya Existe");
                          $mensaje1=1;
                         $transaction->rollback();
                    }
                    
               
                 
		 $this->redirect(array('index'));
                
                }//fin del if de sub
                else{
                    
                     $model->attributes=$_POST['Clausuras'];
                    $model->validate();
                    
                }
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
                    $clausuras="select  cod_convencion, nro_clausura from clausuras where id='".$id."'";
                    $verificando1=YII::app()->db->createCommand($clausuras)->queryAll();
                    
                    $verificar2="select id from clausuras where cod_convencion='".$verificando1[0]['cod_convencion']."' and nro_clausura='".$verificando1[0]['nro_clausura']."'";
                    $verificando3=YII::app()->db->createCommand($verificar2)->queryAll();
                    foreach($verificando3 as $valor){
                       $this->loadModel($valor['id'])->delete();
                    }
                    
                
		

		// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
		if(!isset($_GET['ajax']))
			$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
            
                $criteria= new CDbCriteria;
                //$criteria->select = 'AVG(t.column1) as cc';
                $criteria->group = 'cod_convencion, nro_clausura,tipo_clausura,sub_tipo';
                $dataProvider=new CActiveDataProvider('Clausuras',array( 'criteria'=>$criteria,));
                
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Clausuras('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Clausuras']))
			$model->attributes=$_GET['Clausuras'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Clausuras the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
		$model=Clausuras::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Clausuras $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='clausuras-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        
        
         public function actionsubtipo(){
            
           $id_tipo= $_POST['Clausuras']['tipo_clausura']; 
           $lista= SubTipo::model()->findAll('id_tipo_clausura= :tipo',array(':tipo'=>$id_tipo));
            $lista=CHtml::listData($lista,'id','nombre_sub_tipo_clausura');
           echo CHtml::tag('option',array('value'=>''),'Seleccione un Sub-Tipo Clausura...',true);
            foreach ($lista as $valor =>$subtipo){
                echo CHtml::tag('option',array('value'=>$valor),CHtml::encode($subtipo),true);
            }
            
        }
        
        
        public function actioncargar_campos(){
           $sub_tipo=$_GET['sub_tipo'];
           $sql="select a.id, id_subtipo, tipo_campo, upper(nombre_variable) as nombre_variable, tamanio, upper(nomenclatura) as nomenclatura, tipo from variable_subtipo_clausura as a, tipos_campos as b where a.tipo_campo=b.id and a.id_subtipo='".$sub_tipo."'";
           $resultado=YII::app()->db->createCommand($sql)->queryAll();
           if(isset($_GET['sub_tipo']) && !empty($_GET['sub_tipo'])){
            echo "<fieldset>
                       	<legend><label  class='required'>Llenar Variables</label></legend>";
           foreach ($resultado as $valor){
               if($valor['tipo']=='entero' or $valor['tipo']=='texto'){
                  
               echo "<div class='row'>
                   <label  class='required'>".$valor['nombre_variable']."' <span class='required'>*</span></label>
                   <input type='text' name='".str_replace(' ', '', $valor['nombre_variable'])."' id='".str_replace(' ', '', $valor['nombre_variable'])."' size='".$valor['tamanio']."'
                    /> ".$valor['nomenclatura']."
                   </div>";
               
               echo "<div class='row'>
                   <input type='hidden' id='id_variable' name='id_variable_".str_replace(' ', '', $valor['nombre_variable'])."' value='".$valor['id']."' />
                    </div>";
               
               }
               
               if($valor['tipo']=='booleano'){
                   
                   echo "<div class='row'>
                   <label  class='required'>".$valor['nombre_variable']."<span class='required'>*</span></label>
                   <input type='checkbox' name='".str_replace(' ', '', $valor['nombre_variable'])."', id='".str_replace(' ', '', $valor['nombre_variable'])."' value='true'>
                    ".$valor['nomenclatura']."
                    </div>";
                    echo "<div class='row'>
                   <input type='hidden' id='id_variable' name='id_variable_".str_replace(' ', '', $valor['nombre_variable'])."' value='".$valor['id']."' />
                    </div>"; 
                    }
               
               /*if($valor['tipo']=='text'){
                   
               echo "<div class='row'>
                   <label  class='required'>".$valor['nomenclatura']."' <span class='required'>*</span></label>
                   <input type='text' name='".trim($valor['nombre_variable'])."' id='".trim($valor['nombre_variable'])."' size='".$valor['tamanio']."'
                    />
                   </div>";
               
               echo "<div class='row'>
                   <input type='hidden' id='id_variable' name='id_variable_".trim($valor['nombre_variable'])." value='".$valor['id']."' />
                    </div>"; 
                   
               }*/
               
           }
           echo "</fieldset>";
           
           }else{
               
           }
           
        }
        
        
        
        
        
        
         public function actioneditar_campos(){
           $sub_tipo=$_GET['sub_tipo'];
           $sql="select a.id, id_subtipo, tipo_campo, upper(nombre_variable) as nombre_variable, tamanio, upper(nomenclatura) as nomenclatura, tipo from variable_subtipo_clausura as a, tipos_campos as b where a.tipo_campo=b.id and a.id_subtipo='".$sub_tipo."'";
           $resultado=YII::app()->db->createCommand($sql)->queryAll();
           if(isset($_GET['sub_tipo']) && !empty($_GET['sub_tipo'])){
            echo "<fieldset>
                       	<legend><label  class='required'>Llenar Variables</label></legend>";
           foreach ($resultado as $valor){
               $sql="SELECT valor, id_variable FROM clausuras WHERE id_variable='".$valor['id']."' and cod_convencion='".$_GET['convencion']."'";
               $resultado_valor=YII::app()->db->createCommand($sql)->queryAll(); 
              
               if($valor['tipo']=='entero' or $valor['tipo']=='texto'){
              
               
               echo "<div class='row'>
                   <label  class='required'>".$valor['nombre_variable']."' <span class='required'>*</span></label>
               <input type='text' name='".str_replace(' ', '', $valor['nombre_variable'])."' id='".str_replace(' ', '', $valor['nombre_variable'])."' size='".$valor['tamanio']."' value='".(isset($resultado_valor[0]['valor']) || !empty($resultado_valor[0]['valor']) ? $resultado_valor[0]['valor'] : '')."'
                    /> ".$valor['nomenclatura']."
                   </div>";
               
               echo "<div class='row'>
                   <input type='hidden' id='id_variable' name='id_variable_".str_replace(' ', '', $valor['nombre_variable'])."' value='".$valor['id']."' />
                    </div>";
               
               }
               
               if($valor['tipo']=='booleano'){
                  
                   echo "<div class='row'>
                   <label  class='required'>".$valor['nombre_variable']."<span class='required'>*</span></label>
                   <input type='checkbox' 
                   name='".str_replace(' ', '', $valor['nombre_variable'])."' 
                   id='".str_replace(' ', '', $valor['nombre_variable'])."' 
                   value= 'true'
                   ".(isset($resultado_valor[0]['valor']) || !empty($resultado_valor[0]['valor']) ? 'checked' : '')."
                    /> ".$valor['nomenclatura']."
                    </div>";
                   
                   
                    echo "<div class='row'>
                   <input type='hidden' 
                   id='id_variable' name='id_variable_".str_replace(' ', '', $valor['nombre_variable'])."' value='".$valor['id']."' />
                    </div>"; 
                    }
               }
           echo "</fieldset>";
           
           }else{
               
           }
           
        }
        
        
        
        
        
        
        
        
        
}
