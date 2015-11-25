<?php
/* @var $this NominaController */
/* @var $model Nomina */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'nomina_form_file',
	'enableAjaxValidation'=>false,
    
    'htmlOptions'=>array(
        'enctype'=>'multipart/form-data'
    )
)); ?>
    
    
    
    
    <?php //echo $form->errorSummary($model); ?>
	 <div id="statusMsg">
<?php if(Yii::app()->user->getFlash('error')):?>
    <div class="flash-error">
        <?php echo Yii::app()->user->getFlash('error'); ?>
    </div>
<?php endif; ?>
</div>
	 <div class="row">
	  <?php echo $form->labelEx($model,'csvfile'); ?>
	        <?php
	            $this->widget('CMultiFileUpload', array(
	                'model'=>$model,
	                'name' => 'csvfile',
	                'max'=>1,
	                'accept' => 'csv',
	                'duplicate' => 'Duplicate file!',
	                'denied' => 'Invalid file type',             
	            ));
                    
                    
	        ?>
	  <?php echo $form->error($model,'csvfile'); ?>
	 </div>
    <div class="row">
        <?php echo $form->labelEx($model,'id_empresa'); ?>
        
	<?php           $list = Empresa::model()->findALL(array('condition'=>"cod_convencion=$_GET[convencion]"));
                        $niveles=CHtml::listData($list,'id','razon_social');  
                        echo $form->dropDownList($model,'id_empresa',
                        $niveles,
                        array('prompt'=>'Seleccione una Empresa')
                        ); 
        
        ?>
        
      <?php echo $form->error($model,'id_empresa'); ?>
        
        
                  
                  
        
    </div>
    <div class="row">
        
         <?php echo $form->labelEx($model,'id_sindicato'); ?>
        
	<?php            $list = Sindicato::model()->findALL(array('condition'=>"cod_convencion=$_GET[convencion]"));
                        $niveles=CHtml::listData($list,'id','nombre');  
                        echo $form->dropDownList($model,'id_sindicato',
                        $niveles,
                        array('prompt'=>'Seleccione un Sindicato')
                        ); 
        
        ?>
        
      <?php echo $form->error($model,'id_sindicato'); ?>
        
        
    </div>
    
   
    
    
    <div class="row">
        <br>
        Formato de Carga de 
       <?php $src= Yii::app()->request->baseUrl;
 $url2 = $src."/archivos/nomina.xls";
 echo"<tr><td style='border:4px solid;border-color: black;text-align: center;'>".
 CHtml::link('Nomina', $url2)." (Recuerde Guardar en Formato CSV al Subir)</td></tr>";
        ?>
        
    </div> 
    
    
    <div class="row">
        
		<?php echo $form->hiddenField($model,'cod_convencion',array('size'=>60,'maxlength'=>50, 'value'=>$_GET['convencion'])); ?>
               
	
        
        
    </div>
	 
	 <div class="row buttons">
	  <?php echo CHtml::submitButton('Subir',array("id"=>"Import",'name'=>'Import')); ?>
	 </div>
	<?php $this->endWidget(); ?>
    
    

	


</div><!-- form -->