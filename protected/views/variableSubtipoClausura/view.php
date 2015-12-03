<?php
/* @var $this VariableSubtipoClausuraController */
/* @var $model VariableSubtipoClausura */

$this->breadcrumbs=array(
	'Variable Subtipo Clausuras'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'Listar VariableSubtipoClausura', 'url'=>array('index')),
	array('label'=>'Crear VariableSubtipoClausura', 'url'=>array('create')),
	array('label'=>'Modificar VariableSubtipoClausura', 'url'=>array('update', 'id'=>$model->id)),
	//array('label'=>'Delete VariableSubtipoClausura', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Buscar VariableSubtipoClausura', 'url'=>array('admin')),
);
?>

<h1>View VariableSubtipoClausura #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
                 array('name'=>'Sub Tipo',
                'value'=>$model->idSubtipo->nombre_sub_tipo_clausura,),
		
                 array('name'=>'Tipo Campo',
                'value'=>$model->tiposcampos->tipo,),
		
		'nombre_variable',
		'tamanio',
		'nomenclatura',
	),
)); ?>
