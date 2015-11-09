<?php
/* @var $this ConvencionController */
/* @var $model Convencion */



$this->menu=array(
	array('label'=>'Listar Convencion', 'url'=>array('index')),
	array('label'=>'Buscar Convencion', 'url'=>array('admin')),
);
?>

<h1>Crear Convencion</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model,'resultado'=>$resultado,'bandera'=>0)); ?>