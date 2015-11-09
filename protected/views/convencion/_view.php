<?php
/* @var $this ConvencionController */
/* @var $data Convencion */
?>

<div class="view">

	
	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->nombre), array('convencion/view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('numero_expediente')); ?>:</b>
	<?php echo CHtml::encode($data->numero_expediente); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('inspectoria')); ?>:</b>
	<?php echo CHtml::encode($data->inspectoria0->inspectoria); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sector')); ?>:</b>
	<?php echo CHtml::encode($data->sector==1? 'Público' : 'Privado' ); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('ambito')); ?>:</b>
	<?php echo CHtml::encode($data->ambito0->nombre_ambito); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('edicion')); ?>:</b>
	<?php echo CHtml::encode($data->edicion); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_deposito')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_deposito); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_inicio')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_inicio); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_venc')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_venc); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('duracion_meses')); ?>:</b>
	<?php echo CHtml::encode($data->duracion_meses); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('fecha_auto_homo')); ?>:</b>
	<?php echo CHtml::encode($data->fecha_auto_homo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('costo_contrato')); ?>:</b>
	<?php echo CHtml::encode($data->costo_contrato); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('costo_contrato_sin_prestaciones')); ?>:</b>
	<?php echo CHtml::encode($data->costo_contrato_sin_prestaciones); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_convencion')); ?>:</b>
	<?php echo CHtml::encode($data->cod_convencion); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('referencia')); ?>:</b>
	<?php echo CHtml::encode($data->referencia); ?>
	<br />

	*/ ?>

</div>