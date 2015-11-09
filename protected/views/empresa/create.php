<?php
/* @var $this EmpresaController */
/* @var $model Empresa */



$this->menu=array(
	array('label'=>'Listar Empresa', 'url'=>array('index')),
	array('label'=>'Buscar Empresa', 'url'=>array('admin')),
);
?>

<h1>Crear Empresa</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model, 'bandera'=>0)); ?>