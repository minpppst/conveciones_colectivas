<?php
/* @var $this ClausurasController */
/* @var $data Clausuras */
?>

<div class="view">

	

	<b><?php echo CHtml::encode($data->getAttributeLabel('cod_convencion')); ?>:</b>
        <?php echo CHtml::link(CHtml::encode($data->codConvencion->nombre), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('nro_clausura')); ?>:</b>
	<?php echo CHtml::encode($data->nro_clausura); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('tipo_clausura')); ?>:</b>
	<?php echo CHtml::encode($data->tipoClausura->nombre_tipo_clausura); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('sub_tipo')); ?>:</b>
	<?php echo CHtml::encode($data->subTipo->nombre_sub_tipo_clausura); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('id_variable')); ?>:</b>
	<?php echo CHtml::encode($data->idVariable->nombre_variable); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('valor')); ?>:</b>
	<?php echo CHtml::encode($data->valor); ?>
	<br />


</div>