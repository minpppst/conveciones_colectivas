<?php
/* @var $this ConvencionController */
/* @var $model Convencion */
/* @var $form CActiveForm */
?>

<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<!--<div class="row">
		<?php// echo $form->label($model,'id'); ?>
		<?php// echo $form->textField($model,'id',array('size'=>20,'maxlength'=>20)); ?>
	</div>-->

	<div class="row">
		<?php echo $form->label($model,'nombre'); ?>
		<?php echo $form->textField($model,'nombre',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'numero_expediente'); ?>
		<?php echo $form->textField($model,'numero_expediente',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'inspectoria'); ?>
		<?php echo $form->textField($model,'inspectoria',array('size'=>40,'maxlength'=>40)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'sector'); ?>
		<?php echo $form->textField($model,'sector'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'ambito'); ?>
		<?php echo $form->textField($model,'ambito'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'edicion'); ?>
		<?php echo $form->textField($model,'edicion'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_deposito'); ?>
		<?php echo $form->textField($model,'fecha_deposito'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_inicio'); ?>
		<?php echo $form->textField($model,'fecha_inicio'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_venc'); ?>
		<?php echo $form->textField($model,'fecha_venc'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'duracion_meses'); ?>
		<?php echo $form->textField($model,'duracion_meses'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_auto_homo'); ?>
		<?php echo $form->textField($model,'fecha_auto_homo'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'costo_contrato'); ?>
		<?php echo $form->textField($model,'costo_contrato',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'costo_contrato_sin_prestaciones'); ?>
		<?php echo $form->textField($model,'costo_contrato_sin_prestaciones',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'cod_convencion'); ?>
		<?php echo $form->textField($model,'cod_convencion',array('size'=>11,'maxlength'=>11)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'referencia'); ?>
		<?php echo $form->textField($model,'referencia',array('size'=>15,'maxlength'=>15)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Buscar'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->