<?php
/* @var $this SubTipoController */
/* @var $model SubTipo */



$this->menu=array(
	array('label'=>'Listar SubTipo', 'url'=>array('index')),
	array('label'=>'Crear SubTipo', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#sub-tipo-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Buscar Sub Tipos</h1>

<p>
Puedes Colocar Operadores de comparación. (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>).
</p>

<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'sub-tipo-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'id_tipo_clausura',
		'nombre_sub_tipo_clausura',
		array(
			'class'=>'CButtonColumn',
                        'template'=>'{view}{update}{delete}',
            
                    'buttons' => array(
                     'delete' => array(
                         'label'=>'Borrar',
                        'visible' => '!Yii::app()->user->isGuest && Yii::app()->user->isSuperAdmin',
                     ),),
                    
		),
	),
)); ?>
