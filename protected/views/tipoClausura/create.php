<?php
/* @var $this TipoClausuraController */
/* @var $model TipoClausura */


$this->menu=array(
	array('label'=>'Listar TipoClausura', 'url'=>array('index')),
	array('label'=>'Buscar TipoClausura', 'url'=>array('admin')),
);
?>

<h1>Crear TipoClausura</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>