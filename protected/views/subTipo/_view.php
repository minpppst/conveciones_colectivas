<?php
/* @var $this SubTipoController */
/* @var $data SubTipo */
?>

<div class="view">

	
        <b><?php echo CHtml::encode($data->getAttributeLabel('nombre_sub_tipo_clausura')); ?>:</b>
        <?php echo CHtml::link(CHtml::encode($data->nombre_sub_tipo_clausura), array('view', 'id'=>$data->id)); ?>
	<br />


	<b><?php echo CHtml::encode($data->getAttributeLabel('id_tipo_clausura')); ?>:</b>
	<?php echo CHtml::encode($data->idTipoClausura->nombre_tipo_clausura); ?>
	<br />

	

</div>