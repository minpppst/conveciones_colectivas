<?php
/* @var $this TipoClausuraController */
/* @var $model TipoClausura */



$this->menu=array(
	array('label'=>'Listar TipoClausura', 'url'=>array('index')),
	array('label'=>'Crear TipoClausura', 'url'=>array('create')),
	array('label'=>'Ver TipoClausura', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Buscar TipoClausura', 'url'=>array('admin')),
);
?>

<h1>Modificar TipoClausura <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>