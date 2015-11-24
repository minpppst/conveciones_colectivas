<?php
/* @var $this SindicatoController */
/* @var $model Sindicato */


$this->menu=array(
	array('label'=>'Listar Sindicato', 'url'=>array('index')),
	//array('label'=>'Crear Sindicato', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#sindicato-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Buscar Sindicatos</h1>

<p>
Puedes Colocar Operadores de comparación (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>).
</p>

<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'sindicato-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'nombre',
		'siglas',
		'nro_boleta_inscripcion',
		'folio_registro',
		'tomo_registroo',
            array(
                  'name'=>'cod_convencion',
                     'value'=>'$data->codConvencion->nombre',
                     'filter'=>Sindicato::getListcod_convencion(),
                     
                 ),
		/*
		'rif',
		'direccion',
		'estado',
		'municipio',
		'parroquia',
		'telefono',
		'federacion_nacional',
		'federacion_regional',
		'sector',
		'ambito',
		'tipo_organizacion',
		'fecha_registro',
		'fecha_actualizacion',
		'duracion_junta_directiva',
		'fecha_inicio_vigencia',
		'fecha_cese_vigencia',
		'fecha_informe_finanzas',
		'fecha_nomina_afiliado',
		'fecha_ultimas_elecciones',
		'cod_convencion',
		*/
		array(
			'class'=>'CButtonColumn',
                        'buttons' => array(
                        'delete' => array(
                        'label'=>'Borrar',
                        'visible' => '!Yii::app()->user->isGuest && Yii::app()->user->isSuperAdmin',
                     ),
                
                ),
		),
	),
)); ?>
