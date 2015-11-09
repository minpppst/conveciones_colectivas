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
//        $pp=llenar_check(1,$arr);
//        exit();
        //almacenar en dos arreglos
        $ii=1;
        $iii=0;
        //echo count($arr); exit();
        for($i=0;$i<(count($arr));$i=$i+2){
            $nomina[$iii]=$arr[$iii];
            $cedula[$ii]=$arr[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $iii=0;$ii=1;
        //insert de los resultados anteriores
        
        for($i=0;$i<count($nomina);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina[$iii]."' and trabajador='".$cedula[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
         if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set trabajadores_amparados_conve_col=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
         }
        }
        
        }
       
        //////////////*******************trabajadores_sindicato
        if(!empty($_POST['theIds1'])){    
        $arr1 = explode(',', $_POST['theIds1']);
        //almacenar en dos arreglos
        $ii=1;
        $iii=0;
            for($i=0;$i<count($arr1);$i=$i+2){
            $nomina1[$iii]=$arr1[$iii];
            $cedula1[$ii]=$arr1[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        
        $iii=0;$ii=1;
        //insert de los resultados anteriores
        
        for($i=0;$i<count($nomina1);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina1[$iii]."' and trabajador='".$cedula1[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
         if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set trabajadores_afiliados_sindicato=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
         }
        }
        }
        
       //////////////*******************Secretario General
        if(!empty($_POST['theIds2'])){    
        $arr2= explode(',', $_POST['theIds2']);
        //almacenar en dos arreglos
        $ii=1;
        $iii=0;
        for($i=0;$i<count($arr2);$i=$i+2){
            $nomina2[$iii]=$arr2[$iii];
            $cedula2[$ii]=$arr2[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $iii=0;$ii=1;
        //insert de los resultados anteriores
        
        for($i=0;$i<count($nomina2);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina2[$iii]."' and trabajador='".$cedula2[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
         if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_general=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
         }
        }
        }
        
           //****************************secretario Ejecutivo
        if(!empty($_POST['theIds3'])){    
        $arr3 = explode(',', $_POST['theIds3']);
        //almacenar en dos arreglos
        $ii=1;
        $iii=0;
        for($i=0;$i<count($arr3);$i=$i+2){
            $nomina3[$iii]=$arr3[$iii];
            $cedula3[$ii]=$arr3[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $iii=0;$ii=1;
        //insert de los resultados anteriores
        
        for($i=0;$i<count($nomina3);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina3[$iii]."' and trabajador='".$cedula3[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
         if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_ejecutivo=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
         }
        }
        }
         
        
            //secretario tesorero
        if(!empty($_POST['theIds4'])){    
        $arr4 = explode(',', $_POST['theIds4']);
        //almacenar en dos arreglos
        $ii=1;
        $iii=0;
        for($i=0;$i<count($arr4);$i=$i+2){
            $nomina4[$iii]=$arr4[$iii];
            $cedula4[$ii]=$arr4[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        
        $iii=0;$ii=1;
        //insert de los resultados anteriores
        
        for($i=0;$i<count($nomina4);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina4[$iii]."' and trabajador='".$cedula4[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
         if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_tesorero=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
         }
        }
        
        }
        
            //secretario finanzas
        if(!empty($_POST['theIds5'])){    
        $arr5 = explode(',', $_POST['theIds5']);
        //almacenar en dos arreglos
        $ii=1;
        $iii=0;
        for($i=0;$i<count($arr5);$i=$i+2){
            $nomina5[$iii]=$arr5[$iii];
            $cedula5[$ii]=$arr5[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $iii=0;$ii=1;
        //insert de los resultados anteriores
        
        for($i=0;$i<count($nomina5);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina5[$iii]."' and trabajador='".$cedula5[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_finanzas=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        }
        }
        
        
        
        
        }
        
        //secretario trabajo
        if(!empty($_POST['theIds6'])){    
        $arr6 = explode(',', $_POST['theIds6']);
        //almacenar en dos arreglos
        $ii=1;
        $iii=0;
        for($i=0;$i<count($arr6);$i=$i+2){
            $nomina6[$iii]=$arr6[$iii];
            $cedula6[$ii]=$arr6[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        
        $iii=0;$ii=1;
        //insert de los resultados anteriores
        
        for($i=0;$i<count($nomina6);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina6[$iii]."' and trabajador='".$cedula6[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_trabajo_reclamos=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        }
        }
        }
        
           //secretario deporte
        if(!empty($_POST['theIds7'])){    
        $arr7 = explode(',', $_POST['theIds7']);
        //almacenar en dos arreglos
        $ii=1;
        $iii=0;
        for($i=0;$i<count($arr7);$i=$i+2){
            $nomina7[$iii]=$arr7[$iii];
            $cedula7[$ii]=$arr7[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
            
        }
        
        $iii=0;$ii=1;
        //insert de los resultados anteriores
        
        for($i=0;$i<count($nomina7);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina7[$iii]."' and trabajador='".$cedula7[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_cultura_deporte=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        }
        }
        
        }
        
        
           //secretario organizacion
        if(!empty($_POST['theIds8'])){    
        $arr8 = explode(',', $_POST['theIds8']);
        //almacenar en dos arreglos
        $ii=1;
        $iii=0;
        for($i=0;$i<count($arr8);$i=$i+2){
            $nomina8[$iii]=$arr8[$iii];
            $cedula8[$ii]=$arr8[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $iii=0;$ii=1;
        //insert de los resultados anteriores
        $ii=1;
        $iii=0;
        for($i=0;$i<count($nomina8);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina8[$iii]."' and trabajador='".$cedula8[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_organizacion=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        }
        }
        }
        
        
           //secretario actas y correspondencias
        if(!empty($_POST['theIds9'])){    
        $arr9 = explode(',', $_POST['theIds9']);
        //almacenar en dos arreglos
        $ii=1;
        $iii=0;
        for($i=0;$i<count($arr9);$i=$i+2){
            $nomina9[$iii]=$arr9[$iii];
            $cedula9[$ii]=$arr9[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $ii=1;
        $iii=0;
        for($i=0;$i<count($nomina9);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina9[$iii]."' and trabajador='".$cedula9[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_actas_correspondencias=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        }
        }
        
        }
        
        //secretario salud laboral
        if(!empty($_POST['theIds10'])){    
        $arr10= explode(',', $_POST['theIds10']);
        $ii=1;
        $iii=0;
        //almacenar en dos arreglos
        for($i=0;$i<count($arr10);$i=$i+2){
            $nomina10[$iii]=$arr10[$iii];
            $cedula10[$ii]=$arr10[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $ii=1;
        $iii=0;
        for($i=0;$i<count($nomina10);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina10[$iii]."' and trabajador='".$cedula10[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_salud_laboral=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        }
        }
        
        
        
        }
        
        
        //secretario vigilancia
        if(!empty($_POST['theIds11'])){    
        $arr11= explode(',', $_POST['theIds11']);
        //almacenar en dos arreglos
            $ii=1;
            $iii=0;
        for($i=0;$i<count($arr11);$i=$i+2){
            $nomina11[$iii]=$arr11[$iii];
            $cedula11[$ii]=$arr11[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        
        
        $ii=1;
        $iii=0;
        for($i=0;$i<count($nomina11);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina11[$iii]."' and trabajador='".$cedula11[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_vigilancia_disciplina=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        }
        }
        
        }
       
        
        //secretario otro
        if(!empty($_POST['theIds12'])){    
        $arr12= explode(',', $_POST['theIds12']);
        //almacenar en dos arreglos
       $ii=1;
       $iii=0;
        for($i=0;$i<count($arr12);$i=$i+2){
            $nomina12[$iii]=$arr12[$iii];
            $cedula12[$ii]=$arr12[$ii];
            $ii=$ii+2;
            $iii=$iii+2;
        }
        $ii=1;
       $iii=0;
       for($i=0;$i<count($nomina12);$i++){
        $select="select id from trabajador_sindicato  where nomina_sindicato='".$nomina12[$iii]."' and trabajador='".$cedula12[$ii]."'";
        $iii=$iii+2;$ii=$ii+2;
        $resultado_sql= Yii::app()->db->createCommand($select)->queryRow();
        if($resultado_sql['id']!=0){
        $sql = "update trabajador_sindicato set secretario_otro=".$_POST['status']." where id=".$resultado_sql['id'];
        //$parameters = array(":some_value"=>$);
        Yii::app()->db->createCommand($sql)->execute();
        }
        }
        }
        
        
        //delegado sindical
        if(!empty($_POST['theIds13'])){    
        $arr13= explode(',', $_POST['theIds13']);
        //almacenar en dos arreglos
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
        }
        
        }
        
        //print_r($nomina);
        //print_r($cedula);
        exit();
        
       
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
