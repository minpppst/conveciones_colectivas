<?php
/* @var $this ClausurasController */
/* @var $model Clausuras */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'clausuras-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'numero_clausura'); ?>
		<?php echo $form->textField($model,'numero_clausura'); ?>
		<?php echo $form->error($model,'numero_clausura'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'descripcion_clausura'); ?>
		
            <?php
            $this->widget('application.extensions.cleditor.ECLEditor', array(
        'model'=>$model,
        'attribute'=>'descripcion_clausura', //Model attribute name. Nome do atributo do modelo.
        'options'=>array(
            'width'=>'600',
            'height'=>250,
            'useCSS'=>true,
        ),
        'value'=>$model->descripcion_clausura, //If you want pass a value for the widget. I think you will. Se você precisar passar um valor para o gadget. Eu acho irá.
    ));
            
            
            ?>
		<?php echo $form->error($model,'descripcion_clausura'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'cod_convencion'); ?>
		<?php echo $form->textField($model,'cod_convencion',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'cod_convencion'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->