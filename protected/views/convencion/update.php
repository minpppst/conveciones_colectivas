<?php
/* @var $this ConvencionController */
/* @var $model Convencion */



$this->menu=array(
	array('label'=>'Listar Convencion', 'url'=>array('index')),

	array('label'=>'Ver Convencion', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Buscar Convencion', 'url'=>array('admin')),
);
?>

<h1>Modificar Convencion <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model, 'bandera'=>0, 'resultado'=>0)); ?>