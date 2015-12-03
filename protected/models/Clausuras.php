<?php

/**
 * This is the model class for table "clausuras".
 *
 * The followings are the available columns in table 'clausuras':
 * @property string $id
 * @property string $cod_convencion
 * @property integer $nro_clausura
 * @property string $tipo_clausura
 * @property string $sub_tipo
 * @property string $id_variable
 * @property string $valor
 *
 * The followings are the available model relations:
 * @property VariableSubtipoClausura $idVariable
 * @property Convencion $codConvencion
 * @property TipoClausura $tipoClausura
 * @property SubTipo $subTipo
 */
class Clausuras extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Clausuras the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'clausuras';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_variable, nro_clausura, tipo_clausura,  sub_tipo', 'required'),
			array('nro_clausura', 'numerical', 'integerOnly'=>true),
			array('cod_convencion, tipo_clausura, sub_tipo, id_variable', 'length', 'max'=>20),
			array('valor', 'length', 'max'=>255),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, cod_convencion, nro_clausura, tipo_clausura, sub_tipo, id_variable, valor', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'idVariable' => array(self::BELONGS_TO, 'VariableSubtipoClausura', 'id_variable'),
			'codConvencion' => array(self::BELONGS_TO, 'Convencion', 'cod_convencion'),
			'tipoClausura' => array(self::BELONGS_TO, 'TipoClausura', 'tipo_clausura'),
			'subTipo' => array(self::BELONGS_TO, 'SubTipo', 'sub_tipo'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'cod_convencion' => 'Cod Convencion',
			'nro_clausura' => 'Nro Clausura',
			'tipo_clausura' => 'Tipo Clausura',
			'sub_tipo' => 'Sub Tipo',
			'id_variable' => 'Id Variable',
			'valor' => 'Valor',
		);
	}
         public static function getListconvencion_clau()
             {
             return CHtml::listData(Convencion::model()->findAll(array('order'=>'nombre')),'id','nombre');
             }
             
             
             public static function getListtipo_clau()
             {
             return CHtml::listData(TipoClausura::model()->findAll(array('order'=>'nombre_tipo_clausura')),'id','nombre_tipo_clausura');
             }
             
             public static function getListsubtipo_clau()
             {
             return CHtml::listData(SubTipo::model()->findAll(array('order'=>'nombre_sub_tipo_clausura')),'id','nombre_sub_tipo_clausura');
             }
	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('cod_convencion',$this->cod_convencion,true);
		$criteria->compare('nro_clausura',$this->nro_clausura);
		$criteria->compare('tipo_clausura',$this->tipo_clausura,true);
		$criteria->compare('sub_tipo',$this->sub_tipo,true);
		$criteria->compare('id_variable',$this->id_variable,true);
		$criteria->compare('valor',$this->valor,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
        
        
        
          public function behaviors()
                {
                    return array(
                        // Classname => path to Class
                        'ActiveRecordLogableBehavior'=>
                            'application.behaviors.ActiveRecordLogableBehavior',
                    );
                }
}