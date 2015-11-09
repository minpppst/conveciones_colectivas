<?php
/* @var $this EmpresaController */
/* @var $model Empresa */



$this->menu=array(
	array('label'=>'Listar Empresa', 'url'=>array('index')),
	//array('label'=>'Crear Empresa', 'url'=>array('create')),
	array('label'=>'Modificar Empresa', 'url'=>array('update', 'id'=>$model->id)),
	//array('label'=>'Borrar Empresa', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Buscar Empresa', 'url'=>array('admin')),
);
?>

<h1>Ver Empresa #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		
		'razon_social',
		'rif',
		'identificacion_laboral',
		'seguro_social',
		
                array('name'=>'actividad_economica',
                'value'=>$model->actividadEconomica->rama,),
		array('name'=>'sector',
                'value'=>$model->sector0->nombre,),
		'capital_empresa',
		'nro_sucursales',
		'direccion',
		array('name'=>'estado',
                'value'=>$model->estado0->estado,),
		array('name'=>'municipio',
                'value'=>$model->municipio0->municipio,),
		array('name'=>'parroquias',
                'value'=>$model->parroquia0->parroquia,),
		'telefono',
		'fax',
		'correo',
		'web',
		'rnc',
		'cod_convencion',
	),
)); ?>
