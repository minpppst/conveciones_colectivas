<?php
/* @var $this TipoClausuraController */
/* @var $model TipoClausura */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'tipo-clausura-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'nombre_tipo_clausura'); ?>
		<?php echo $form->textField($model,'nombre_tipo_clausura',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'nombre_tipo_clausura'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->