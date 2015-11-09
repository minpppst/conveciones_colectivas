<?php
/* @var $this SindicatoController */
/* @var $model Sindicato */
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
		<?php echo $form->label($model,'nombre'); ?>
		<?php echo $form->textField($model,'nombre',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'siglas'); ?>
		<?php echo $form->textField($model,'siglas',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nro_boleta_inscripcion'); ?>
		<?php echo $form->textField($model,'nro_boleta_inscripcion',array('size'=>15,'maxlength'=>15)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'folio_registro'); ?>
		<?php echo $form->textField($model,'folio_registro'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tomo_registroo'); ?>
		<?php echo $form->textField($model,'tomo_registroo',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'rif'); ?>
		<?php echo $form->textField($model,'rif',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'direccion'); ?>
		<?php echo $form->textField($model,'direccion',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'estado'); ?>
		<?php echo $form->textField($model,'estado'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'municipio'); ?>
		<?php echo $form->textField($model,'municipio'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'parroquia'); ?>
		<?php echo $form->textField($model,'parroquia'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'telefono'); ?>
		<?php echo $form->textField($model,'telefono',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'federacion_nacional'); ?>
		<?php echo $form->textField($model,'federacion_nacional',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'federacion_regional'); ?>
		<?php echo $form->textField($model,'federacion_regional',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'sector'); ?>
		<?php echo $form->textField($model,'sector',array('size'=>11,'maxlength'=>11)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'ambito'); ?>
		<?php echo $form->textField($model,'ambito'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tipo_organizacion'); ?>
		<?php echo $form->textField($model,'tipo_organizacion'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_registro'); ?>
		<?php echo $form->textField($model,'fecha_registro'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_actualizacion'); ?>
		<?php echo $form->textField($model,'fecha_actualizacion'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'duracion_junta_directiva'); ?>
		<?php echo $form->textField($model,'duracion_junta_directiva'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_inicio_vigencia'); ?>
		<?php echo $form->textField($model,'fecha_inicio_vigencia'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_cese_vigencia'); ?>
		<?php echo $form->textField($model,'fecha_cese_vigencia'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_informe_finanzas'); ?>
		<?php echo $form->textField($model,'fecha_informe_finanzas'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_nomina_afiliado'); ?>
		<?php echo $form->textField($model,'fecha_nomina_afiliado'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'fecha_ultimas_elecciones'); ?>
		<?php echo $form->textField($model,'fecha_ultimas_elecciones'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'cod_convencion'); ?>
		<?php echo $form->textField($model,'cod_convencion',array('size'=>20,'maxlength'=>20)); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->