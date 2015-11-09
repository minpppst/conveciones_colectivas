<?php
/* @var $this NominaController */
/* @var $data Nomina */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombres')); ?>:</b>
	<?php echo CHtml::encode($data->nombres); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('apellidos')); ?>:</b>
	<?php echo CHtml::encode($data->apellidos); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nacionalidad')); ?>:</b>
	<?php echo CHtml::encode($data->nacionalidad); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('pais_origen')); ?>:</b>
	<?php echo CHtml::encode($data->pais_origen); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('lugar_nacimiento')); ?>:</b>
	<?php echo CHtml::encode($data->lugar_nacimiento); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sexo')); ?>:</b>
	<?php echo CHtml::encode($data->sexo); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('edad')); ?>:</b>
	<?php echo CHtml::encode($data->edad); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('estado_civil')); ?>:</b>
	<?php echo CHtml::encode($data->estado_civil); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nivel_educativo')); ?>:</b>
	<?php echo CHtml::encode($data->nivel_educativo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('grado_anio_aprobado')); ?>:</b>
	<?php echo CHtml::encode($data->grado_anio_aprobado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('oficio_dentro_establecimiento')); ?>:</b>
	<?php echo CHtml::encode($data->oficio_dentro_establecimiento); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('codigo_ocupacion')); ?>:</b>
	<?php echo CHtml::encode($data->codigo_ocupacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tiempo_serv_establecimiento_anios')); ?>:</b>
	<?php echo CHtml::encode($data->tiempo_serv_establecimiento_anios); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tiempo_serv_establecimiento_meses')); ?>:</b>
	<?php echo CHtml::encode($data->tiempo_serv_establecimiento_meses); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tiempo_ejerciciendo_prefesion_anios')); ?>:</b>
	<?php echo CHtml::encode($data->tiempo_ejerciciendo_prefesion_anios); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tiempo_ejerciendo_profesion_meses')); ?>:</b>
	<?php echo CHtml::encode($data->tiempo_ejerciendo_profesion_meses); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('remuneracion_antes_contra_empleado')); ?>:</b>
	<?php echo CHtml::encode($data->remuneracion_antes_contra_empleado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('remuneracion_antes_contra_obrero')); ?>:</b>
	<?php echo CHtml::encode($data->remuneracion_antes_contra_obrero); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('remuneracion_despues_contra_empleado')); ?>:</b>
	<?php echo CHtml::encode($data->remuneracion_despues_contra_empleado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('remuneracion_despues_contra_obrero')); ?>:</b>
	<?php echo CHtml::encode($data->remuneracion_despues_contra_obrero); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('carga_familiar')); ?>:</b>
	<?php echo CHtml::encode($data->carga_familiar); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_convencion')); ?>:</b>
	<?php echo CHtml::encode($data->cod_convencion); ?>
	<br />

	*/ ?>

</div>