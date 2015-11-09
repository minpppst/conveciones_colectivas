<?php
/* @var $this ConvencionController */
/* @var $model Convencion */


$this->menu=array(
	array('label'=>'Listar Empresa', 'url'=>array('index')),
	//array('label'=>'Crer Convencion', 'url'=>array('create')),
	//array('label'=>'View Convencion', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Buscar Empresa', 'url'=>array('admin')),
);
?>

<h1>Empresa Con Referencia </h1>

<?php echo $this->renderPartial('_form', array('model'=>$model,'convencion'=>$_GET['convencion'],'bandera'=>'1')); ?>