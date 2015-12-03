<?php
/* @var $this SubTipoController */
/* @var $model SubTipo */



$this->menu=array(
	array('label'=>'Listar SubTipo', 'url'=>array('index')),
	array('label'=>'Crear SubTipo', 'url'=>array('create')),
	array('label'=>'Modificar SubTipo', 'url'=>array('update', 'id'=>$model->id)),
	//array('label'=>'Delete SubTipo', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Buscar SubTipo', 'url'=>array('admin')),
);
?>

<h1>Ver SubTipo #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'id_tipo_clausura',
                  array('name'=>'Tipo Clausura',
                'value'=>$model->idTipoClausura->nombre_tipo_clausura,),
		'nombre_sub_tipo_clausura',
	),
)); ?>
