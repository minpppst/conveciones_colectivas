<?php

/**
 * This is the model class for table "resumen_clausuras".
 *
 * The followings are the available columns in table 'resumen_clausuras':
 * @property string $id
 * @property string $cod_convencion
 * @property string $cod_tipo
 * @property integer $cantidad
 *
 * The followings are the available model relations:
 * @property Convencion $codConvencion
 * @property TipoClausuras $tipoclausuras
 */
class ResumenClausuras extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return ResumenClausuras the static model class
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
		return 'resumen_clausuras';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cod_convencion, cod_tipo, cantidad', 'required'),
			array('cantidad', 'numerical', 'integerOnly'=>true),
			array('cod_convencion, cod_tipo', 'length', 'max'=>20),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, cod_convencion, cod_tipo, cantidad', 'safe', 'on'=>'search'),
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
			'codConvencion' => array(self::BELONGS_TO, 'Convencion', 'cod_convencion'),
                        'tipoclausuras' => array(self::BELONGS_TO, 'TipoClausura', 'cod_tipo'),
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
			'cod_tipo' => 'Cod Tipo',
			'cantidad' => 'Cantidad',
                        
		);
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
		$criteria->compare('cod_tipo',$this->cod_tipo,true);
		$criteria->compare('cantidad',$this->cantidad);
               
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
        
        
       
         public static function getListresumen()
             {
             return CHtml::listData(Convencion::model()->findAll(array('order'=>'nombre')),'id','nombre');
             }
             
             public static function getListtipo()
             {
             return CHtml::listData(TipoClausura::model()->findAll(array('order'=>'id')),'id','nombre_tipo_clausura');
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