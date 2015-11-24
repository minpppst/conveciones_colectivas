<?php
/* @var $this NominaController */
/* @var $model Nomina */
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
		<?php echo $form->label($model,'nombres'); ?>
		<?php echo $form->textField($model,'nombres',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	

	<div class="row">
		<?php echo $form->label($model,'nacionalidad'); ?>
		<?php echo $form->textField($model,'nacionalidad',array('size'=>1,'maxlength'=>1)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'pais_origen'); ?>
		<?php echo $form->textField($model,'pais_origen',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'lugar_nacimiento'); ?>
		<?php echo $form->textField($model,'lugar_nacimiento',array('size'=>60,'maxlength'=>100)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'sexo'); ?>
		<?php echo $form->textField($model,'sexo',array('size'=>1,'maxlength'=>1)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'edad'); ?>
		<?php echo $form->textField($model,'edad'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'estado_civil'); ?>
		<?php echo $form->textField($model,'estado_civil',array('size'=>1,'maxlength'=>1)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'nivel_educativo'); ?>
		<?php echo $form->textField($model,'nivel_educativo',array('size'=>2,'maxlength'=>2)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'grado_anio_aprobado'); ?>
		<?php echo $form->textField($model,'grado_anio_aprobado'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'oficio_dentro_establecimiento'); ?>
		<?php echo $form->textField($model,'oficio_dentro_establecimiento',array('size'=>60,'maxlength'=>255)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'codigo_ocupacion'); ?>
		<?php echo $form->textField($model,'codigo_ocupacion'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tiempo_serv_establecimiento_anios'); ?>
		<?php echo $form->textField($model,'tiempo_serv_establecimiento_anios'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tiempo_serv_establecimiento_meses'); ?>
		<?php echo $form->textField($model,'tiempo_serv_establecimiento_meses'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tiempo_ejerciendo_profesion_anios'); ?>
		<?php echo $form->textField($model,'tiempo_ejerciendo_profesion_anios'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'tiempo_ejerciendo_profesion_meses'); ?>
		<?php echo $form->textField($model,'tiempo_ejerciendo_profesion_meses'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'remuneracion_antes_contra_empleado'); ?>
		<?php echo $form->textField($model,'remuneracion_antes_contra_empleado',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'remuneracion_antes_contra_obrero'); ?>
		<?php echo $form->textField($model,'remuneracion_antes_contra_obrero',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'remuneracion_despues_contra_empleado'); ?>
		<?php echo $form->textField($model,'remuneracion_despues_contra_empleado',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'remuneracion_despues_contra_obrero'); ?>
		<?php echo $form->textField($model,'remuneracion_despues_contra_obrero',array('size'=>10,'maxlength'=>10)); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'carga_familiar'); ?>
		<?php echo $form->textField($model,'carga_familiar'); ?>
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