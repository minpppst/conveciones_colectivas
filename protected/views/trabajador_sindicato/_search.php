<?php
/* @var $this Trabajador_sindicatoController */
/* @var $model Trabajador_sindicato */
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
		<?php echo $form->label($model,'nomina_sindicato'); ?>
		<?php echo $form->textField($model,'nomina_sindicato',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'trabajador'); ?>
		<?php echo $form->textField($model,'trabajador',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_general'); ?>
		<?php echo $form->textField($model,'secretario_general'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_ejecutivo'); ?>
		<?php echo $form->textField($model,'secretario_ejecutivo'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_tesorero'); ?>
		<?php echo $form->textField($model,'secretario_tesorero'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_finanzas'); ?>
		<?php echo $form->textField($model,'secretario_finanzas'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_trabajo_reclamos'); ?>
		<?php echo $form->textField($model,'secretario_trabajo_reclamos'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_cultura_deporte'); ?>
		<?php echo $form->textField($model,'secretario_cultura_deporte'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_organizacion'); ?>
		<?php echo $form->textField($model,'secretario_organizacion'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_actas_correspondencias'); ?>
		<?php echo $form->textField($model,'secretario_actas_correspondencias'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_salud_laboral'); ?>
		<?php echo $form->textField($model,'secretario_salud_laboral'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_vigilancia_disciplina'); ?>
		<?php echo $form->textField($model,'secretario_vigilancia_disciplina'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'secretario_otro'); ?>
		<?php echo $form->textField($model,'secretario_otro'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'delegado_sindical'); ?>
		<?php echo $form->textField($model,'delegado_sindical'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->