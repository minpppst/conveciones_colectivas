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
        
		<?php echo $form->hiddenField($model,'cod_convencion',array('size'=>60,'maxlength'=>50, 'value'=>$_GET['convencion'])); ?>
	
        
        
    </div>
	 
	 <div class="row buttons">
	  <?php echo CHtml::submitButton('Subir',array("id"=>"Import",'name'=>'Import')); ?>
	 </div>
	<?php $this->endWidget(); ?>
    
    

	


</div><!-- form -->