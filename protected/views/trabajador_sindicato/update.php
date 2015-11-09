<?php
/* @var $this Trabajador_sindicatoController */
/* @var $model Trabajador_sindicato */


$this->menu=array(
	array('label'=>'Listar Trabajador_sindicato', 'url'=>array('index')),
	//array('label'=>'Crear Trabajador_sindicato', 'url'=>array('create')),
	array('label'=>'Ver Trabajador_sindicato', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Buscar Trabajador_sindicato', 'url'=>array('admin')),
);
?>

<h1>Modificar Trabajador_sindicato <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('create', array('model'=>$model)); ?>