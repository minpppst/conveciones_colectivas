<?php
/* @var $this ConvencionController */
/* @var $model Convencion */


$this->menu=array(
	array('label'=>'Listar Convencion', 'url'=>array('index')),
	//array('label'=>'Crer Convencion', 'url'=>array('create')),
	//array('label'=>'View Convencion', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Buscar Convencion', 'url'=>array('admin')),
);
?>

<h1>Convencion Con Referencia </h1>

<?php echo $this->renderPartial('_form', array('model'=>$model,'resultado'=>$resultado, 'bandera'=>1,)); ?>