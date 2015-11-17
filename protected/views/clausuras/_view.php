<?php
/* @var $this ClausurasController */
/* @var $data Clausuras */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('numero_clausura')); ?>:</b>
	<?php echo CHtml::encode($data->numero_clausura); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('descripcion_clausura')); ?>:</b>
	<?php echo CHtml::encode($data->descripcion_clausura); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_convencion')); ?>:</b>
	<?php echo CHtml::encode($data->cod_convencion); ?>
	<br />


</div>