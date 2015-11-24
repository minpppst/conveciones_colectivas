<?php
/* @var $this EmpresaController */
/* @var $model Empresa */


$this->menu=array(
	array('label'=>'Listar Empresa', 'url'=>array('index')),
	//array('label'=>'Crear Empresa', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#empresa-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Buscar Empresas</h1>

<p>
Puedes Colocar Operadores de comparación. (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) 
</p>

<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'empresa-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'razon_social',
		'rif',
		'identificacion_laboral',
		'seguro_social',
            
		array(
                 'name'=>'actividad_economica',
                 'value'=>'$data->actividadEconomica->rama',  //Con esto se mostrará la descripción de la categoría en vez del id_categoria
                 'filter'=>  Empresa::getListrama(),    //Esto ya es un agregado, muestra un combobox con todas las categorias para poder filtrarlas, si no lo ponemos usa el id_categoria por defecto
                 //Debemos de crear una función estática en el modelo Categorias que se llame getListCategorias(), esto es totalmente opcional
                 ),
                 array(
                  'name'=>'cod_convencion',
                     'value'=>'$data->codConvencion->nombre',
                     'filter'=>Empresa::getListcod_convencion(),
                     
                 ),
		/*
		'sector',
		'capital_empresa',
		'nro_sucursales',
		'direccion',
		'estado',
		'municipio',
		'parroquia',
		'telefono',
		'fax',
		'correo',
		'web',
		'rnc',
		'cod_convencion',
		*/
		array(
                    'class'=>'CButtonColumn',
                    'template'=>'{view}{update}{delete}',
            
                    'buttons' => array(
                     'delete' => array(
                         'label'=>'Borrar',
                        'visible' => '!Yii::app()->user->isGuest && Yii::app()->user->isSuperAdmin',
                     ),
                
                ),
		),
	),
)); ?>
