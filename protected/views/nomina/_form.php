<?php
/* @var $this NominaController */
/* @var $model Nomina */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'nomina-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>
         
        
	<div class="row">
		<?php echo $form->labelEx($model,'nombres'); ?>
		<?php echo $form->textField($model,'nombres',array('size'=>60,'maxlength'=>100)); ?>
                <?php echo $form->hiddenField($model,'id',array('size'=>60,'maxlength'=>100));
                ?>
		<?php echo $form->error($model,'nombres'); ?>
	</div>
        
        <div class="row">
		<?php echo $form->labelEx($model,'cedula'); ?>
		<?php echo $form->textField($model,'cedula',array('size'=>60,'maxlength'=>15)); ?>
		<?php echo $form->error($model,'cedula'); ?>
	</div>
	

	<div class="row">
		<?php echo $form->labelEx($model,'nacionalidad'); ?>
		<?php echo $form->textField($model,'nacionalidad',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'nacionalidad'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'pais_origen'); ?>
		<?php echo $form->textField($model,'pais_origen',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'pais_origen'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'lugar_nacimiento'); ?>
		<?php echo $form->textField($model,'lugar_nacimiento',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'lugar_nacimiento'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'sexo'); ?>
		<?php echo $form->textField($model,'sexo',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'sexo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'edad'); ?>
		<?php echo $form->textField($model,'edad'); ?>
		<?php echo $form->error($model,'edad'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'estado_civil'); ?>
		<?php echo $form->textField($model,'estado_civil',array('size'=>1,'maxlength'=>1)); ?>
		<?php echo $form->error($model,'estado_civil'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'nivel_educativo'); ?>
		<?php echo $form->textField($model,'nivel_educativo',array('size'=>2,'maxlength'=>2)); ?>
		<?php echo $form->error($model,'nivel_educativo'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'grado_anio_aprobado'); ?>
		<?php echo $form->textField($model,'grado_anio_aprobado'); ?>
		<?php echo $form->error($model,'grado_anio_aprobado'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'oficio_dentro_establecimiento'); ?>
		<?php echo $form->textField($model,'oficio_dentro_establecimiento',array('size'=>60,'maxlength'=>255)); ?>
		<?php echo $form->error($model,'oficio_dentro_establecimiento'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'codigo_ocupacion'); ?>
		<?php echo $form->textField($model,'codigo_ocupacion'); ?>
		<?php echo $form->error($model,'codigo_ocupacion'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tiempo_serv_establecimiento_anios'); ?>
		<?php echo $form->textField($model,'tiempo_serv_establecimiento_anios'); ?>
		<?php echo $form->error($model,'tiempo_serv_establecimiento_anios'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tiempo_serv_establecimiento_meses'); ?>
		<?php echo $form->textField($model,'tiempo_serv_establecimiento_meses'); ?>
		<?php echo $form->error($model,'tiempo_serv_establecimiento_meses'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tiempo_ejerciendo_profesion_anios'); ?>
		<?php echo $form->textField($model,'tiempo_ejerciendo_profesion_anios'); ?>
		<?php echo $form->error($model,'tiempo_ejerciendo_profesion_anios'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'tiempo_ejerciendo_profesion_meses'); ?>
		<?php echo $form->textField($model,'tiempo_ejerciendo_profesion_meses'); ?>
		<?php echo $form->error($model,'tiempo_ejerciendo_profesion_meses'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'remuneracion_antes_contra_empleado'); ?>
		<?php echo $form->textField($model,'remuneracion_antes_contra_empleado',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'remuneracion_antes_contra_empleado'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'remuneracion_antes_contra_obrero'); ?>
		<?php echo $form->textField($model,'remuneracion_antes_contra_obrero',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'remuneracion_antes_contra_obrero'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'remuneracion_despues_contra_empleado'); ?>
		<?php echo $form->textField($model,'remuneracion_despues_contra_empleado',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'remuneracion_despues_contra_empleado'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'remuneracion_despues_contra_obrero'); ?>
		<?php echo $form->textField($model,'remuneracion_despues_contra_obrero',array('size'=>10,'maxlength'=>10)); ?>
		<?php echo $form->error($model,'remuneracion_despues_contra_obrero'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'carga_familiar'); ?>
		<?php echo $form->textField($model,'carga_familiar'); ?>
		<?php echo $form->error($model,'carga_familiar'); ?>
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