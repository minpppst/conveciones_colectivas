<?php
/* @var $this SindicatoController */
/* @var $data Sindicato */
?>

<div class="view">

	

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->nombre), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('siglas')); ?>:</b>
	<?php echo CHtml::encode($data->siglas); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nro_boleta_inscripcion')); ?>:</b>
	<?php echo CHtml::encode($data->nro_boleta_inscripcion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('folio_registro')); ?>:</b>
	<?php echo CHtml::encode($data->folio_registro); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tomo_registroo')); ?>:</b>
	<?php echo CHtml::encode($data->tomo_registroo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('rif')); ?>:</b>
	<?php echo CHtml::encode($data->rif); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('direccion')); ?>:</b>
	<?php echo CHtml::encode($data->direccion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('estado')); ?>:</b>
	<?php echo CHtml::encode($data->estado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('municipio')); ?>:</b>
	<?php echo CHtml::encode($data->municipio); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('parroquia')); ?>:</b>
	<?php echo CHtml::encode($data->parroquia); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('telefono')); ?>:</b>
	<?php echo CHtml::encode($data->telefono); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('federacion_nacional')); ?>:</b>
	<?php echo CHtml::encode($data->federacion_nacional); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('federacion_regional')); ?>:</b>
	<?php echo CHtml::encode($data->federacion_regional); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sector')); ?>:</b>
	<?php echo CHtml::encode($data->sector); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ambito')); ?>:</b>
	<?php echo CHtml::encode($data->ambito); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo_organizacion')); ?>:</b>
	<?php echo CHtml::encode($data->tipo_organizacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_registro')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_registro); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_actualizacion')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_actualizacion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('duracion_junta_directiva')); ?>:</b>
	<?php echo CHtml::encode($data->duracion_junta_directiva); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_inicio_vigencia')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_inicio_vigencia); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_cese_vigencia')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_cese_vigencia); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_informe_finanzas')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_informe_finanzas); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_nomina_afiliado')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_nomina_afiliado); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_ultimas_elecciones')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_ultimas_elecciones); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_convencion')); ?>:</b>
	<?php echo CHtml::encode($data->cod_convencion); ?>
	<br />

	*/ ?>

</div>