<?php
/* @var $this SindicatoController */
/* @var $model Sindicato */


$this->menu=array(
	array('label'=>'Listar Sindicato', 'url'=>array('index')),
	array('label'=>'Buscar Sindicato', 'url'=>array('admin')),
);
?>

<h1>Crear Sindicato</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model, 'bandera'=>0)); ?>