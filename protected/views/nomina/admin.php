<?php
/* @var $this NominaController */
/* @var $model Nomina */

$this->breadcrumbs=array(
	'Nominas'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List Nomina', 'url'=>array('index')),
	array('label'=>'Create Nomina', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#nomina-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Nominas</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'nomina-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'nombres',
		'apellidos',
		'nacionalidad',
		'pais_origen',
		'lugar_nacimiento',
		/*
		'sexo',
		'edad',
		'estado_civil',
		'nivel_educativo',
		'grado_anio_aprobado',
		'oficio_dentro_establecimiento',
		'codigo_ocupacion',
		'tiempo_serv_establecimiento_anios',
		'tiempo_serv_establecimiento_meses',
		'tiempo_ejerciciendo_prefesion_anios',
		'tiempo_ejerciendo_profesion_meses',
		'remuneracion_antes_contra_empleado',
		'remuneracion_antes_contra_obrero',
		'remuneracion_despues_contra_empleado',
		'remuneracion_despues_contra_obrero',
		'carga_familiar',
		'cod_convencion',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
