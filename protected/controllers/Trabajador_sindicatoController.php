<?php

class Trabajador_sindicatoController extends Controller
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
				'actions'=>array('index','view','GetValue','llenar_check'),
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
                
                $model=new Trabajador_sindicato;
                        //$model->find('id=13');
                       // $model=Trabajador_sindicato::model()->findP('id',$id);
              // print_r($model); exit();
                //$model->find('id',$id);
                
//               $dataProvider=new CActiveDataProvider('Trabajador_sindicato');
//               
//               
//		$this->render('index',array(
//			'dataProvider'=>$dataProvider,
//		));            
                 
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
            if(isset($_POST['userids'])){
               print_r($_POST['userids']);
                //print_r($_POST['autoId']);
            }
      
          
           // $criteria = new CDbCriteria();
           // $criteria->compare('id', $_GET_['convencion'], true, 'OR');
		$model=new Trabajador_sindicato;
                //$model->finatri('nomina_sindicato',$_GET['convencion']);
              
                
                $model->findByAttributes(array('nomina_sindicato'=>$_GET['convencion']));
               
               if($model===null)
		throw new CHttpException(404,'The requested page does not exist.');
            $this->render('create',array(
			'model'=>$model
		));
            
            
            
            
            
            
            
        

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Trabajador_sindicato']))
		{
			$model->attributes=$_POST['Trabajador_sindicato'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id));
		}

	//	$this->render('create',array(
	//		'model'=>$model,
	//	));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
        
        public function actionGetValue(){
 
     
         //trabajadores beneficiados   
        if(!empty($_POST['theIds'])){    
        
        $arr = explode(',', $_POST['theIds']);
//        
        $pp=  funciones::llenar_check(1,$arr, $_POST['status']);
         
        }
       
        //////////////*******************trabajadores_sindicato
        if(!empty($_POST['theIds1'])){    
        $arr1 = explode(',', $_POST['theIds1']);
        //almacenar en dos arreglos
       $pp=  funciones::llenar_check(2,$arr1, $_POST['status']);
        
        }
        
       //////////////*******************Secretario General
        if(!empty($_POST['theIds2'])){    
        $arr2= explode(',', $_POST['theIds2']);
         $pp=  funciones::llenar_check(3,$arr2, $_POST['status']);
        
        }
        
           //****************************secretario Ejecutivo
        if(!empty($_POST['theIds3'])){    
        $arr3 = explode(',', $_POST['theIds3']);
        $pp=  funciones::llenar_check(4,$arr3, $_POST['status']);
        }
         
        
            //secretario tesorero
        if(!empty($_POST['theIds4'])){    
        $arr4 = explode(',', $_POST['theIds4']);
        $pp=  funciones::llenar_check(5,$arr4, $_POST['status']);
        }
        
            //secretario finanzas
        if(!empty($_POST['theIds5'])){    
        $arr5 = explode(',', $_POST['theIds5']);
        $pp=  funciones::llenar_check(6,$arr5, $_POST['status']);
        }
        
        //secretario trabajo
        if(!empty($_POST['theIds6'])){    
        $arr6 = explode(',', $_POST['theIds6']);
        $pp=  funciones::llenar_check(7,$arr6, $_POST['status']);
        }
        
           //secretario deporte
        if(!empty($_POST['theIds7'])){    
        $arr7 = explode(',', $_POST['theIds7']);
        $pp=  funciones::llenar_check(8,$arr7, $_POST['status']);
        
        }
        
        
           //secretario organizacion
        if(!empty($_POST['theIds8'])){    
        $arr8 = explode(',', $_POST['theIds8']);
        $pp=  funciones::llenar_check(9,$arr8, $_POST['status']);
        }
        
        
           //secretario actas y correspondencias
        if(!empty($_POST['theIds9'])){    
        $arr9 = explode(',', $_POST['theIds9']);
        $pp=  funciones::llenar_check(10,$arr9, $_POST['status']);
        }
        
        //secretario salud laboral
        if(!empty($_POST['theIds10'])){    
        $arr10= explode(',', $_POST['theIds10']);
        $pp=  funciones::llenar_check(11,$arr10, $_POST['status']);
        }
        
        
        //secretario vigilancia
        if(!empty($_POST['theIds11'])){    
        $arr11= explode(',', $_POST['theIds11']);
        $pp=  funciones::llenar_check(12,$arr11, $_POST['status']);
        
        }
       
        
        //secretario otro
        if(!empty($_POST['theIds12'])){    
        $arr12= explode(',', $_POST['theIds12']);
        //almacenar en dos arreglos
       $pp=  funciones::llenar_check(13,$arr12, $_POST['status']);
        }
        
        
        //delegado sindical
        if(!empty($_POST['theIds13'])){    
        $arr13= explode(',', $_POST['theIds13']);
       $pp=  funciones::llenar_check(14,$arr13, $_POST['status']);
        /* //almacenar en dos arreglos
            $ii=1;
            $iii=0;
        for($i=0;$i<count($arr13);$i=$i+2){
            $nomina13[$iii]=$arr13[$iii];
            $cedula13[$ii]=$arr13[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $ii=1;
       $iii=0;
       for($i=0;$i<count($nomina13);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina13[$iii]."' and trabajador='".$cedula13[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set delegado_sindical=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        }
        }*/
        
        }
        
        //print_r($nomina);
        //print_r($cedula);
        //exit();
        
       
    }
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Trabajador_sindicato']))
		{
			$model->attributes=$_POST['Trabajador_sindicato'];
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
            
            
            
		$dataProvider=new CActiveDataProvider('Trabajador_sindicato');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Trabajador_sindicato('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Trabajador_sindicato']))
			$model->attributes=$_GET['Trabajador_sindicato'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer $id the ID of the model to be loaded
	 * @return Trabajador_sindicato the loaded model
	 * @throws CHttpException
	 */
	public function loadModel($id)
	{
                //echo $id; exit();
		$model=Trabajador_sindicato::model()->findByAttributes(array('id'=>$id));
		
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param Trabajador_sindicato $model the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='trabajador-sindicato-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        
        
        
        
        public function llenar_check($caso,$ids){
            
            if($caso==1){
               $columna="trabajadores_amparados_conve_col";
            }
            if($caso==2){
               $columna="trabajadores_afiliados_sindicato";
            }
            if($caso==3){
               $columna="secretario_general";
            }
            if($caso==4){
               $columna="secretario_ejeecutivo";
            }
            if($caso==5){
               $columna="secretario_tesorero";
            }
            if($caso==6){
               $columna="secretario_finanzas";
            }
            if($caso==7){
               $columna="secretario_trabajo_reclamos";
            }
            if($caso==8){
               $columna="secretario_cultura_deporte";
            }
            if($caso==9){
               $columna="secretario_organizacion";
            }
            if($caso==10){
               $columna="secretario_actas_correspondencias";
            }
            if($caso==11){
               $columna="secretario_salud_laboral";
            }
            if($caso==12){
               $columna="secretario_vigilancia_disciplina";
            }
            if($caso==13){
               $columna="secretario_otro";
            }
            if($caso==14){
               $columna="delegado_sindical";
            }
            $ii=1;
            $iii=0;
            for($i=0;$i<count($ids);$i=$i+2){
            $nomina[$iii]=$ids[$iii];
            $cedula[$ii]=$ids[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $ii=1;
       $iii=0;
       for($i=0;$i<count($nomina);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina[$iii]."' and trabajador='".$cedula[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set ".$columna."=1 where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        }
        }
         return 1; 
        }
}
