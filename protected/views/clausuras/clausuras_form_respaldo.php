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
		<?php echo $form->labelEx($model,'cod_convencion'); ?>
		<?php echo $form->textField($model,'cod_convencion',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'cod_convencion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nro_clausura'); ?>
		<?php echo $form->textField($model,'nro_clausura'); ?>
		<?php echo $form->error($model,'nro_clausura'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tipo_clausura'); ?>
		<?php echo $form->textField($model,'tipo_clausura',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'tipo_clausura'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'sub_tipo'); ?>
		<?php echo $form->textField($model,'sub_tipo',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'sub_tipo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'id_variable'); ?>
		<?php echo $form->textField($model,'id_variable',array('size'=>20,'maxlength'=>20)); ?>
		<?php echo $form->error($model,'id_variable'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'valor'); ?>
		<?php echo $form->textField($model,'valor',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'valor'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->