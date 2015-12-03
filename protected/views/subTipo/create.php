<?php
/* @var $this SubTipoController */
/* @var $model SubTipo */



$this->menu=array(
	array('label'=>'Listar SubTipo', 'url'=>array('index')),
	array('label'=>'Buscar SubTipo', 'url'=>array('admin')),
);
?>

<h1>Crear SubTipo</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>