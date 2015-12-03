<?php
/* @var $this VariableSubtipoClausuraController */
/* @var $model VariableSubtipoClausura */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id'); ?>
		<?php echo $form->textField($model,'id',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'id_subtipo'); ?>
		<?php echo $form->textField($model,'id_subtipo',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tipo_campo'); ?>
		<?php echo $form->textField($model,'tipo_campo',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nombre_variable'); ?>
		<?php echo $form->textField($model,'nombre_variable',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tamanio'); ?>
		<?php echo $form->textField($model,'tamanio'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nomenclatura'); ?>
		<?php echo $form->textField($model,'nomenclatura',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->