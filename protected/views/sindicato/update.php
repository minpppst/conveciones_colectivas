<?php
/* @var $this SindicatoController */
/* @var $model Sindicato */



$this->menu=array(
	array('label'=>'Listar Sindicato', 'url'=>array('index')),
	//array('label'=>'Crear Sindicato', 'url'=>array('create')),
	array('label'=>'Ver Sindicato', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Buscar Sindicato', 'url'=>array('admin')),
);
?>

<h1>Modificar Sindicato <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model, 'bandera'=>0)); ?>