<?php
/* @var $this NominaController */
/* @var $model Nomina */

$this->breadcrumbs=array(
	'Nominas'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	//array('label'=>'Listar Nomina', 'url'=>array('index')),
	//array('label'=>'Crear Nomina', 'url'=>array('create')),
	//array('label'=>'Ver Nomina', 'url'=>array('view', 'id'=>$model->id)),
	//array('label'=>'Buscar Nomina', 'url'=>array('admin')),
);
?>

<h1>Update Nomina <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>