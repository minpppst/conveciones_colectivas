<?php
/* @var $this VariableSubtipoClausuraController */
/* @var $data VariableSubtipoClausura */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_subtipo')); ?>:</b>
	<?php echo CHtml::encode($data->idSubtipo->nombre_sub_tipo_clausura); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo_campo')); ?>:</b>
	<?php echo CHtml::encode($data->tiposcampos->tipo); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre_variable')); ?>:</b>
	<?php echo CHtml::encode($data->nombre_variable); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tamaño')); ?>:</b>
	<?php echo CHtml::encode($data->tamanio); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nomenclatura')); ?>:</b>
	<?php echo CHtml::encode($data->nomenclatura); ?>
	<br />


</div>