<?php
/* @var $this NominaController */
/* @var $model Nomina */



$this->menu=array(
	//array('label'=>'List Nomina', 'url'=>array('index')),
	array('label'=>'Buscar Nomina', 'url'=>array('admin')),
);
?>

<h1>Crear Nomina</h1>

<?php echo $this->renderPartial('_form_file', array('model'=>$model)); ?>