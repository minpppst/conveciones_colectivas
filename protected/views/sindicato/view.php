<?php
/* @var $this SindicatoController */
/* @var $model Sindicato */



$this->menu=array(
	array('label'=>'Listar Sindicato', 'url'=>array('index')),
	//array('label'=>'Crear Sindicato', 'url'=>array('create')),
	array('label'=>'Modificar Sindicato', 'url'=>array('update', 'id'=>$model->id)),
	//array('label'=>'Borrar Sindicato', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	//array('label'=>'Buscar Sindicato', 'url'=>array('admin')),
);
?>

<h1> Sindicato #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'nombre',
		'siglas',
		'nro_boleta_inscripcion',
		'folio_registro',
		'tomo_registroo',
		'rif',
		'direccion',
		array('name'=>'estado',
                'value'=>$model->estado0->estado,),
		array('name'=>'municipio',
                'value'=>$model->municipio0->municipio,),
		array('name'=>'parroquia',
                'value'=>$model->parroquia0->parroquia,),
		'telefono',
		'federacion_nacional',
		'federacion_regional',
		array('name'=>'sector',
                'value'=>$model->sector0->nombre,),
		array('name'=>'ambito',
                'value'=>$model->ambito0->nombre_ambito,),
		array('name'=>'tipo_organizacion',
                'value'=>$model->tipoOrganizacion->descripcion,),
                
		'fecha_registro',
		'fecha_actualizacion',
		'duracion_junta_directiva',
		'fecha_inicio_vigencia',
		'fecha_cese_vigencia',
		'fecha_informe_finanzas',
		'fecha_nomina_afiliado',
		'fecha_ultimas_elecciones',
		'cod_convencion',
	),
)); ?>
