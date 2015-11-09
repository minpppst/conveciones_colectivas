<?php
/* @var $this Trabajador_sindicatoController */
/* @var $data Trabajador_sindicato */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nomina_sindicato')); ?>:</b>
	<?php echo CHtml::encode($data->nomina_sindicato ); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('trabajador')); ?>:</b>
	<?php echo CHtml::encode($data->trabajador); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_general')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_general ? 'Si' : 'No'); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_ejecutivo')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_ejecutivo ? 'Si' : 'No'); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_tesorero')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_tesorero ? 'Si' : 'No'); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_finanzas')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_finanzas ? 'Si' : 'No'); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_trabajo_reclamos')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_trabajo_reclamos); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_cultura_deporte')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_cultura_deporte); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_organizacion')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_organizacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_actas_correspondencias')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_actas_correspondencias); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_salud_laboral')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_salud_laboral); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_vigilancia_disciplina')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_vigilancia_disciplina); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('secretario_otro')); ?>:</b>
	<?php echo CHtml::encode($data->secretario_otro); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('delegado_sindical')); ?>:</b>
	<?php echo CHtml::encode($data->delegado_sindical); ?>
	<br />

	*/ ?>

</div>