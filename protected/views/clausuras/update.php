<?php
/* @var $this ClausurasController */
/* @var $model Clausuras */



$this->menu=array(
	array('label'=>'Listar Clausuras', 'url'=>array('index')),
	array('label'=>'Ver Clausuras', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Buscar Clausuras', 'url'=>array('admin')),
);
?>

<h1>Modificar Clausuras <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('modificar_clausura', array('model'=>$model)); ?>