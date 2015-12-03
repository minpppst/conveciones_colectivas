<?php
/* @var $this VariableSubtipoClausuraController */
/* @var $model VariableSubtipoClausura */



$this->menu=array(
	array('label'=>'Listar VariableSubtipoClausura', 'url'=>array('index')),
	array('label'=>'Buscar VariableSubtipoClausura', 'url'=>array('admin')),
);
?>

<h1>Create VariableSubtipoClausura</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>