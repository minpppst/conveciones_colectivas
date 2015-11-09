<?php

/**
 * This is the model class for table "inspectoria".
 *
 * The followings are the available columns in table 'inspectoria':
 * @property string $id
 * @property string $inspectoria
 * @property integer $id_estado
 *
 * The followings are the available model relations:
 * @property Convencion[] $convencions
 * @property Estados $idEstado
 */
class Inspectoria extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Inspectoria the static model class
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
		return 'inspectoria';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id, inspectoria, id_estado', 'required'),
			array('id_estado', 'numerical', 'integerOnly'=>true),
			array('id', 'length', 'max'=>5),
			array('inspectoria', 'length', 'max'=>100),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, inspectoria, id_estado', 'safe', 'on'=>'search'),
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
			'convencions' => array(self::HAS_MANY, 'Convencion', 'inspectoria'),
			'idEstado' => array(self::BELONGS_TO, 'Estados', 'id_estado'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'inspectoria' => 'Inspectoria',
			'id_estado' => 'Id Estado',
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
		$criteria->compare('inspectoria',$this->inspectoria,true);
		$criteria->compare('id_estado',$this->id_estado);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}