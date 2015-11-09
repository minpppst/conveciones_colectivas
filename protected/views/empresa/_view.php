<?php
/* @var $this EmpresaController */
/* @var $data Empresa */
?>

<div class="view">

	

	<b><?php echo CHtml::encode($data->getAttributeLabel('razon_social')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->razon_social), array('view', 'id'=>$data->id));  ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('rif')); ?>:</b>
	<?php echo CHtml::encode($data->rif); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('identificacion_laboral')); ?>:</b>
	<?php echo CHtml::encode($data->identificacion_laboral); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('seguro_social')); ?>:</b>
	<?php echo CHtml::encode($data->seguro_social); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('actividad_economica')); ?>:</b>
	<?php echo CHtml::encode($data->actividadEconomica->rama);//echo CHtml::encode($data->actividad_economica); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sector')); ?>:</b>
	<?php echo CHtml::encode($data->sector0->nombre); ?>
	<br />

	<?php /*
	<b><?php echo CHtml::encode($data->getAttributeLabel('capital_empresa')); ?>:</b>
	<?php echo CHtml::encode($data->capital_empresa); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nro_sucursales')); ?>:</b>
	<?php echo CHtml::encode($data->nro_sucursales); ?>
	<br />

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

	<b><?php echo CHtml::encode($data->getAttributeLabel('fax')); ?>:</b>
	<?php echo CHtml::encode($data->fax); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('correo')); ?>:</b>
	<?php echo CHtml::encode($data->correo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('web')); ?>:</b>
	<?php echo CHtml::encode($data->web); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('rnc')); ?>:</b>
	<?php echo CHtml::encode($data->rnc); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_convencion')); ?>:</b>
	<?php echo CHtml::encode($data->cod_convencion); ?>
	<br />

	*/ ?>

</div>