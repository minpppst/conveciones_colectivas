<?php
/* @var $this ResumenClausurasController */
/* @var $data ResumenClausuras */
?>

<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_convencion')); ?>:</b>
	<?php echo CHtml::encode($data->codConvencion->nombre); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_tipo')); ?>:</b>
	<?php echo CHtml::encode($data->tipoclausuras->nombre_tipo_clausura); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('cantidad')); ?>:</b>
	<?php echo CHtml::encode($data->cantidad); ?>
	<br />


</div>