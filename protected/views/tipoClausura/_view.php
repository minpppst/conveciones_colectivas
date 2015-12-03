<?php
/* @var $this TipoClausuraController */
/* @var $data TipoClausura */
?>

<div class="view">

	

	<b><?php echo CHtml::encode($data->getAttributeLabel('nombre_tipo_clausura')); ?>:</b>
	
        <?php echo CHtml::link(CHtml::encode($data->nombre_tipo_clausura), array('view', 'id'=>$data->id)); ?>
	<br />


</div>